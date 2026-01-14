# Note: This is a minimal example for validation purposes.
# For a real deployment, you would create the REST API, Lambda function, etc.

module "api_endpoint" {
  source = "../../"

  rest_api_id       = "api-id-placeholder"
  parent_id         = "parent-id-placeholder"
  path_part         = "example"
  http_method       = "POST"
  authorization     = "NONE"
  lambda_invoke_arn = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:123456789012:function:my-function/invocations"

  response_status_codes = ["200", "400", "500"]
}
