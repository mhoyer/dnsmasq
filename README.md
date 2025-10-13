# Dnsmasq Alpine Container Image


## Build and Run

```bash
docker compose up --build
```

## Test DHCP

```bash
sudo nmap -sU -p67 --script dhcp-discover <DHCP_SERVER_IP>
```
