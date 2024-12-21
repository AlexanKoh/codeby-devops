variable "machine_type" {
  description = "The type of machine to create"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "Zone for the VM"
  type        = string
  default     = "us-central1-a"
}

variable "instance_type" {
  description = "Type of the instance to launch"
  type        = string
  default     = "n1-standard-1"
}

variable "image_project" {
  description = "Image project for the VM"
  type        = string
  default     = "ubuntu-os-cloud"
}

variable "image_family" {
  description = "Image family for the VM"
  type        = string
  default     = "ubuntu-22-04-lts"
}
