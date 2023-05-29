variable "aws_region" {}
variable "account_id" {}
variable "ecr_repo" {}
variable "image_version" {
    type = string
}

variable "image_source" {
  default = "sheikh111/demo-actions-repo"
}
