FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b
  RUN apk upgrade --update --no-cache \
    && apk add --update --no-cache dnsmasq \
    && rm -rf /var/cache/apk/*

  # Expose ports: 53/tcp (DNS), 67/udp & 68/udp (DHCP)
  EXPOSE 53/udp
  EXPOSE 53/tcp
  EXPOSE 67/udp
  EXPOSE 68/udp

  ENTRYPOINT ["dnsmasq", "-k", "--log-facility=/dev/stdout"]
