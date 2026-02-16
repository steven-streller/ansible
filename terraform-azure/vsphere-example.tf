provider "vsphere" {
  # Konfiguration
}

resource "vsphere_virtual_machine" "vm" {
  name             = "web01"
  num_cpus         = 2
  memory           = 4096
  guest_id         = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    size = 40
  }
}
