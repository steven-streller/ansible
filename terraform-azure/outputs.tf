# Ausgabe der öffentlichen IP-Adresse (wichtig für den Zugriff)
output "public_ip_address" {
  description = "Die öffentliche IP-Adresse der erstellten VM"
  value       = azurerm_public_ip.main.ip_address
}

# Ausgabe der privaten IP (wichtig für interne Kommunikation/Monitoring)
output "private_ip_address" {
  description = "Die interne IP-Adresse im Subnetz"
  value       = azurerm_network_interface.main.private_ip_address
}

# Ausgabe der Ressourcen-ID (hilfreich für Logging/Tagging-Audits)
output "vm_id" {
  description = "Die Azure Resource ID der Virtual Machine"
  value       = azurerm_linux_virtual_machine.main.id
}

# Bonus: Ein generierter SSH-String für den schnellen Check
output "ssh_connect_command" {
  description = "Befehl zum direkten Verbinden via SSH"
  value       = "ssh ${azurerm_linux_virtual_machine.main.admin_username}@${azurerm_public_ip.main.ip_address}"
}