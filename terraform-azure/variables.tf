variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Präfix für alle Ressourcen-Namen"
  type        = string
  default     = "sre-lab"
}

variable "location" {
  description = "Azure Region für das Deployment"
  type        = string
  default     = "Switzerland North"
}

variable "vnet_address_space" {
  description = "Adressbereich für das virtuelle Netzwerk"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "vm_size" {
  description = "Instanzgröße der Virtual Machine"
  type        = string
  default     = "Standard_D2s_v3"

  validation {
    condition     = contains(["Standard_D2s_v3", "Standard_B2s"], var.vm_size)
    error_message = "Zulässige Instanzgrößen sind nur Standard_D2s_v3 oder Standard_B2s."
  }
}

variable "admin_username" {
  description = "Username für den VM-Administrator"
  type        = string
  default     = "sysadmin"
}

variable "ssh_public_key_path" {
  description = "Pfad zum öffentlichen SSH-Key"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "common_tags" {
  description = "Standard-Tags für alle Ressourcen (wichtig für Billing/Ordnung)"
  type        = map(string)
  default     = {
    Environment = "Dev-Test"
    Owner       = "SRE-Team"
    ManagedBy   = "Terraform"
  }
}

variable "admin_remote_ip" {
  description = "Die öffentliche IP des Administrators (z.B. Home Office oder Firmen-VPN)"
  type        = string
  default     = "91.37.104.19/32"
}