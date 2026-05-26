variable "rest_api_id" {
  description = "ID of the REST API"
  type        = string
  validation {
    condition     = length(var.rest_api_id) > 0
    error_message = "rest_api_id must not be empty."
  }
}

variable "resource_id" {
  description = "ID of the API Gateway resource"
  type        = string
  validation {
    condition     = length(var.resource_id) > 0
    error_message = "resource_id must not be empty."
  }
}

variable "http_method" {
  description = "HTTP method (GET, POST, PUT, DELETE, ANY, etc.)"
  type        = string
  validation {
    condition     = contains(["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS", "HEAD", "ANY"], var.http_method)
    error_message = "http_method must be a valid HTTP method or ANY."
  }
}

variable "authorization" {
  description = "Authorization type (NONE, AWS_IAM, CUSTOM, COGNITO_USER_POOLS)"
  type        = string
  default     = "NONE"
}

variable "authorizer_id" {
  description = "ID of the authorizer"
  type        = string
  default     = null
}
