output "enabled" {
  description = "Whether the module is enabled"
  value       = local.enabled
}

output "http_method" {
  description = "HTTP method configured"
  value       = try(aws_api_gateway_method.this[0].http_method, null)
}
