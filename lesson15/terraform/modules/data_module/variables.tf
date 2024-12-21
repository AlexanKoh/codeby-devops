variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
}

variable "region" {
  description = "The region in which to create resources."
  type        = string
  default     = "us-central1"
}
