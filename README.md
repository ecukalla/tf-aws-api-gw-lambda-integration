# API Gateway Lambda Integration Module

This module creates a standard API Gateway resource, method, integration (Lambda Proxy), and responses.

## Usage

```hcl
module "example_endpoint" {
  source = "./modules/api_gateway_endpoint"

  rest_api_id       = aws_api_gateway_rest_api.example.id
  parent_id         = aws_api_gateway_rest_api.example.root_resource_id
  path_part         = "example"
  http_method       = "GET"
  lambda_invoke_arn = aws_lambda_function.example.invoke_arn
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rest\_api\_id | The ID of the REST API | `string` | n/a | yes |
| parent\_id | The ID of the parent resource | `string` | n/a | yes |
| path\_part | The last path segment of this API resource | `string` | n/a | yes |
| http\_method | The HTTP Method | `string` | `"GET"` | no |
| authorization | The type of authorization | `string` | `"NONE"` | no |
| lambda\_invoke\_arn | The invoke ARN of the Lambda function | `string` | n/a | yes |
| request\_parameters | Map of request parameters | `map(bool)` | `{}` | no |
| request\_validator\_id | The ID of a Request Validator | `string` | `null` | no |
| response\_model\_name | The name of the response model | `string` | `"Empty"` | no |

## Outputs

| Name | Description |
|------|-------------|
| resource\_id | The resource ID of the API Gateway resource |
| http\_method | The HTTP method |
| integration\_id | The ID of the API Gateway integration |
| method\_id | The ID of the API Gateway method |
