resource "aws_api_gateway_resource" "this" {
  rest_api_id = var.rest_api_id
  parent_id   = var.parent_id
  path_part   = var.path_part
}

resource "aws_api_gateway_method" "this" {
  rest_api_id          = var.rest_api_id
  resource_id          = aws_api_gateway_resource.this.id
  http_method          = var.http_method
  authorization        = var.authorization
  authorizer_id        = var.authorizer_id
  request_validator_id = var.request_validator_id
  request_parameters   = var.request_parameters
}

resource "aws_api_gateway_integration" "this" {
  rest_api_id             = var.rest_api_id
  resource_id             = aws_api_gateway_resource.this.id
  http_method             = aws_api_gateway_method.this.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_api_gateway_method_response" "this" {
  for_each = toset(var.response_status_codes)

  rest_api_id = var.rest_api_id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this.http_method
  status_code = each.value
  response_models = {
    "application/json" = var.response_model_name
  }
}

resource "aws_api_gateway_integration_response" "this" {
  for_each = aws_api_gateway_method_response.this

  rest_api_id = var.rest_api_id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this.http_method
  status_code = each.value.status_code

  depends_on = [
    aws_api_gateway_integration.this
  ]
}
