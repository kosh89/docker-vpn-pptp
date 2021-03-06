FROM ubuntu:16.04
MAINTAINER Sergey Vasilyev <kosh.goo@gmail.com>

RUN apt update \
 && apt install -y pptpd iptables

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/chap-secrets /etc/ppp/chap-secrets
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]
