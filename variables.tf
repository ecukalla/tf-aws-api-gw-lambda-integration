variable "rest_api_id" {
  description = "The ID of the REST API"
  type        = string
}

variable "parent_id" {
  description = "The ID of the parent resource"
  type        = string
}

variable "path_part" {
  description = "The last path segment of this API resource"
  type        = string
}

variable "http_method" {
  description = "The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type        = string
  default     = "GET"

  validation {
    condition     = contains(["GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS", "ANY", "PATCH"], var.http_method)
    error_message = "http_method must be one of: GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY, PATCH."
  }
}

variable "authorization" {
  description = "The type of authorization used for the method (NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS)"
  type        = string
  default     = "NONE"

  validation {
    condition     = contains(["NONE", "CUSTOM", "AWS_IAM", "COGNITO_USER_POOLS"], var.authorization)
    error_message = "authorization must be one of: NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS."
  }
}

variable "authorizer_id" {
  description = "The ID of an API Gateway Authorizer. Required if authorization is CUSTOM or COGNITO_USER_POOLS."
  type        = string
  default     = null
}

variable "lambda_invoke_arn" {
  description = "The invoke ARN of the Lambda function"
  type        = string
}

variable "request_parameters" {
  description = "A map of request query string parameters and headers that should be passed to the integration"
  type        = map(bool)
  default     = {}
}

variable "request_validator_id" {
  description = "The ID of a Request Validator"
  type        = string
  default     = null
}

variable "response_model_name" {
  description = "The name of the response model"
  type        = string
  default     = "Empty"
}

variable "response_status_codes" {
  description = "A list of HTTP status codes for method responses."
  type        = list(string)
  default     = ["200"]
}

variable "tags" {
  description = "A map of tags to apply to resources that support tagging."
  type        = map(string)
  default     = {}
}
