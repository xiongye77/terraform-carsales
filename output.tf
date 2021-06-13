output "alb_url_addr" {
  value       =  "${aws_lb.carsales_alb.dns_name}"
  description = "The ALB load balancer URL"
}	
