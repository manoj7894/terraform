variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "access_key" {
  type    = string
  default = "AKIA3FLDW6U6JAUBF7OU"
}

variable "secret_key" {
  type    = string
  default = "EXVHh8T0gWIoWNfKQkHPo1GhLvW92vPqO9hAFTyG"
}

variable "ami" {
  type    = string
  default = "ami-099b3d23e336c2e83"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "supriya"
}

variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}

variable "instance_count" {
  type    = string
  default = "2"
}

variable "ecs_task_execution_role" {
  type    = string
  default = "myECcsTaskExecutionRole"
}

variable "app_image" {
  type    = string
  default = "nginx:latest"
}

variable "app_count" {
  type    = string
  default = "2"
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  type    = string
  default = "1024"
}

variable "fargate_memory" {
  type    = string
  default = "2048"
}

variable "rds_endpoint" {
  type    = string
  default = "your-rds-endpoint.amazonaws.com"
}

variable "rds_port" {
  type    = number
  default = 3306
}
