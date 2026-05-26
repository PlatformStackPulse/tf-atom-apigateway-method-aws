resource "aws_api_gateway_method" "this" {
  count = module.this.enabled ? 1 : 0

  rest_api_id   = var.rest_api_id
  resource_id   = var.resource_id
  http_method   = var.http_method
  authorization = var.authorization
  authorizer_id = var.authorizer_id
}
