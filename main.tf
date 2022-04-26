terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "eu-west-2"
}

resource "aws_redshift_parameter_group" "bar" {
  count = 1
  name   = "parameter-group-test-terraform"
  family = "redshift-1.0"

  parameter {
    name = "wlm_json_configuration"
    value = jsonencode(
      [
        {
          auto_wlm            = true
          concurrency_scaling = "auto"
          name                = "Default queue"
          query_group         = []
          user_group          = []
        },
        {
          query_concurrency = 5
        },
        {
          short_query_queue = true
        },
      ]
    )
  }
  parameter {
    name  = "query_group"
    value = "example"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }

  tags = {
    name = "krk"
    reproduce = "test-2"
    reproduce_count = "krk"
    another_tag = "krasteki"
    onemore = "another"
  }
}