output "vm_id" {
  description = "The ID of the created VM"
  value       = module.vm_module.vm_id
}

output "vm_private_ip" {
  description = "The private IP address of the created VM"
  value       = module.vm_module.vm_private_ip
}
