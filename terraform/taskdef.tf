resource "aws_ecs_task_definition" "td2" {
  container_definitions = jsonencode([
    {
      name         = "td-app"
      image        = "${var.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.ecr_repo}:${var.image_version}"
      cpu          = 256
      memory       = 512
      essential    = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      "logconfiguration":{
        "logDriver":"awslogs",
        "options":{
            "awslogs-group": "/ecs_deploy_gh_actions_myservice",
            "awslogs-region":"${var.aws_region}",
            "awslogs-stream-prefix":"ecs"
        }
      }
    }
  ])
  family                   = "td-app"
  requires_compatibilities = ["FARGATE"]

  cpu                = "256"
  memory             = "512"
  network_mode       = "awsvpc"
  task_role_arn      = "arn:aws:iam::${var.account_id}:role/ecs_deploy_gh_actions-myservice_task"
  execution_role_arn = "arn:aws:iam::${var.account_id}:role/ecs_deploy_gh_actions-ecs_task_exec"
}