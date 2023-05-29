terraform {
  backend "s3" {
    bucket = "github-actions-tfmbucket"
    key= "global/main/terraform.tfstate"
    region = "ap-northeast-2"
  }
}