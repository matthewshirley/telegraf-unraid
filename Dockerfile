FROM telegraf:1.29@sha256:2fd5f3358069034d274aa57a29c8474be5c8676efb4b85e68f92656b8371ac55

RUN apt update && apt install -y --no-install-recommends \
  sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
  rm -rf /var/lib/apt/lists/* && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
  echo "Done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"

