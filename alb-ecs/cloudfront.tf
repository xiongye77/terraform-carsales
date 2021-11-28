resource "random_string" "origin_token" {
  length = 30
  special = false
}

resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = "${var.demo_dns_name}.${data.aws_route53_zone.public.name}"
    origin_id   = "alb"
    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled = true
  aliases   = ["${var.demo_dns_name}.${data.aws_route53_zone.public.name}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id     = "alb"

    forwarded_values {
      query_string = true
      headers        = ["X-Origin-Token"]

      cookies {
        forward = "all"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    ssl_support_method = "sni-only"
    acm_certificate_arn = "arn:aws:acm:us-east-1:996104769930:certificate/cb76cc96-af82-4bf9-9d21-b5a4196ddbc6"
    minimum_protocol_version = "TLSv1.2_2018"
  }
}
