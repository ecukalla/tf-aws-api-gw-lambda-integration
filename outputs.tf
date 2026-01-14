output "resource_id" {
  description = "The resource ID of the API Gateway resource"
  value       = aws_api_gateway_resource.this.id
}

output "resource_path" {
  description = "The complete path for this API resource, including all parent paths."
  value       = aws_api_gateway_resource.this.path
}

output "http_method" {
  description = "The HTTP method"
  value       = aws_api_gateway_method.this.http_method
}

output "integration_id" {
  description = "The ID of the API Gateway integration"
  value       = aws_api_gateway_integration.this.id
}

output "method_id" {
  description = "The ID of the API Gateway method"
  value       = aws_api_gateway_method.this.id
}

output "method_response_status_codes" {
  description = "A map of status codes to their method response IDs."
  value       = { for k, v in aws_api_gateway_method_response.this : k => v.id }
}
