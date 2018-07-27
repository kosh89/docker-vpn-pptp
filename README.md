# PPTP VPN-server

## Before build

Enter username, server, password, ip address in etc/ppp/chap-secrets

### For example:

```
# Secrets for authentication using CHAP
# client        server  secret                  IP addresses
user1 pptpd pass%word *
```

## Build

```
docker build -t vpn .
```

## Run

```
docker run -d --name vpn_pptp --privileged -p 1723:1723 vpn
```
You can add --restart=always parametr for restarting container after reboot
