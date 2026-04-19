FROM alpine:3.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11
  RUN apk upgrade --update --no-cache \
    && apk add --update --no-cache dnsmasq \
    && rm -rf /var/cache/apk/*

  # Expose ports: 53/tcp (DNS), 67/udp & 68/udp (DHCP)
  EXPOSE 53/udp
  EXPOSE 53/tcp
  EXPOSE 67/udp
  EXPOSE 68/udp

  ENTRYPOINT ["dnsmasq", "-k", "--log-facility=/dev/stdout"]
