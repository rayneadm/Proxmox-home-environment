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

variable "instance_count" {
  description = "The number of virtual machines to create"
  type        = number
  default     = 3
}

variable "ip_start" {
  description = "The starting IP address for the virtual machines"
  type        = string
  default     = "192.168.1.80"
}

variable "gateway" {
  description = "The gateway address"
  type        = string
  default     = "192.168.1.254"
}

variable "dns1" {
  description = "The DNS server address"
  type        = string
  default     = "8.8.8.8"
}
variable "dns2" {
  description = "The DNS server address"
  type        = string
  default     = "8.8.4.4"
}





