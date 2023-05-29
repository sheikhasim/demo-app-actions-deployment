resource "aws_cloudwatch_log_group" "logs" {
  name              = "/ecs_deploy_gh_actions_myservice"
  retention_in_days = 30
 
}
