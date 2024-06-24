FROM ghcr.io/wtsi-npg/ub-18.04-irods-clients-dev-4.2.11:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
