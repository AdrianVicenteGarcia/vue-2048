variable "instance_type" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "t2.micro"
}
variable "ami"  {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ami-0d71ea30463e0ff8d"
}
variable "subnet_id"   {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "subnet-02d7cf3e65eeb1c29"
}
variable "vpc_security_group_ids" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "sg-03ccffcba984b8c38"
}
variable "key_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "aws-key-pub"
}
