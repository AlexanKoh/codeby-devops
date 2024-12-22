variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = "custom-vpc"
}

variable "zone" {
  description = "The zone where the VM will be created"
  type        = string
  default     = "us-central1-a"
}

variable "image_project" {
  description = "The GCP project where the image is located"
  type        = string
  default     = "ubuntu-os-cloud"
}

variable "image_family" {
  description = "The image family to use for the VM"
  type        = string
  default     = "ubuntu-22-04-lts"
}
