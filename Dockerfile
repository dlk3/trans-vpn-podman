FROM registry.fedoraproject.org/fedora:latest
RUN dnf install -y transmission-daemon openvpn
RUN dnf upgrade -y
COPY client.up /etc/openvpn/client.up
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh
VOLUME /transmission
VOLUME /etc/openvpn/client
VOLUME /var/log
EXPOSE 11091/tcp
ENTRYPOINT /usr/local/bin/entrypoint.sh
