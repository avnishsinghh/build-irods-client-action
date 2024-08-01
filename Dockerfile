ARG BASE_IMAGE

FROM $BASE_IMAGE

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
