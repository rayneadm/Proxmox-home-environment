variable "pvenode" {
  description = "URL of the Proxmox node"
  type        = string
}

variable "username" {
  description = "Username for authentication"
  type        = string
}

variable "password" {
  description = "Password for authentication"
  type        = string
}

variable "sshkeys" {
  description = "SSH keys for authentication"
  type        = string
}
variable "localip" {
  description = "Local IP address for SSH access"
  type        = string 
}
variable "localgw" {
  description = "Local gateway address for SSH access"
  type        = string
}