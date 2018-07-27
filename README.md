#Before build
Enter username, server, password, ip address in etc/ppp/chap-secrets
For example:
user1 pptpd pass%word *

#Build
docker build -t vpn .

#Run
docker run -d --name vpn_pptp --privileged -p 1723:1723 vpn
