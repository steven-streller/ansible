# Ansible Learning Project

Persönliches Lernprojekt zum Vertiefen von **Ansible** - einem Open-Source Automation Tool für Server-Management und Infrastructure-as-Code.

## Projektstruktur

### `gateway-demo/`
Ein 3-Server Setup zum Lernen von Netzwerk-Routing und Firewall-Management:

- **Server A** (Subnetz 192.168.121.0/24)
- **Server B** (Subnetz 192.168.122.0/24)  
- **Gateway** (verbindet beide Subnetze mit IP Forwarding)

**Dateien:**
- `Vagrantfile` - VM-Definitionen (libvirt)
- `server_a.yml`, `server_b.yml` - Playbooks für die Server
- `gateway.yml` - Gateway mit IP Forwarding

### `nginx/`
Basis-Setup mit Nginx zum Lernen von Ansible Playbooks.

## Quick Start

```bash
# VMs starten
cd gateway-demo
vagrant up

# Provisioning ausführen
vagrant provision
```