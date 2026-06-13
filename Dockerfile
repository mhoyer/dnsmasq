FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4
  RUN apk upgrade --update --no-cache \
    && apk add --update --no-cache dnsmasq \
    && rm -rf /var/cache/apk/*

  # Expose ports: 53/tcp (DNS), 67/udp & 68/udp (DHCP)
  EXPOSE 53/udp
  EXPOSE 53/tcp
  EXPOSE 67/udp
  EXPOSE 68/udp

  ENTRYPOINT ["dnsmasq", "-k", "--log-facility=/dev/stdout"]
