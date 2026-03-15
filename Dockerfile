FROM alpine:3.23.3@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
  RUN apk upgrade --update --no-cache \
    && apk add --update --no-cache dnsmasq \
    && rm -rf /var/cache/apk/*

  # Expose ports: 53/tcp (DNS), 67/udp & 68/udp (DHCP)
  EXPOSE 53/udp
  EXPOSE 53/tcp
  EXPOSE 67/udp
  EXPOSE 68/udp

  ENTRYPOINT ["dnsmasq", "-k", "--log-facility=/dev/stdout"]
