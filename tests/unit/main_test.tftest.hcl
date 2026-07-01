# Unit Tests for tf-atom-apigateway-method-aws
#
# These tests use a mock provider — no real AWS calls are made.
# Run with:    terraform test -test-directory=tests/unit
# Run verbose: terraform test -test-directory=tests/unit -verbose
#
# NOTE: Assertions only reference plan-KNOWN values (tf-label id string,
# input pass-throughs, resource count). Computed attributes such as the
# API Gateway method's real id are unknown under a mock provider and are
# intentionally not asserted on.

mock_provider "aws" {}

variables {
  # tf-label identity inputs
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  # module's own required inputs
  rest_api_id = "abc123def4"
  resource_id = "xyz789ghi0"
  http_method = "POST"
}

# ---------------------------------------------------------------------------
# Test: module creates the method resource when enabled (default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = output.enabled == true
    error_message = "enabled output should be true when the module is enabled"
  }

  assert {
    condition     = output.http_method == "POST"
    error_message = "http_method output should equal the http_method input"
  }

  assert {
    condition     = length(aws_api_gateway_method.this) == 1
    error_message = "exactly one aws_api_gateway_method resource should be planned when enabled"
  }
}

# ---------------------------------------------------------------------------
# Test: module creates nothing when disabled
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = output.enabled == false
    error_message = "enabled output should be false when the module is disabled"
  }

  assert {
    condition     = output.http_method == null
    error_message = "http_method output should be null when the module is disabled"
  }

  assert {
    condition     = length(aws_api_gateway_method.this) == 0
    error_message = "no aws_api_gateway_method resource should be planned when disabled"
  }
}
