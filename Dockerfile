FROM alpine:3.17.0@sha256:af06af3514c44a964d3b905b498cf6493db8f1cde7c10e078213a89c87308ba0
#FROM alpine:3.16.2 

LABEL maintainer="Dockerman <75863443+dockerman2020@users.noreply.github.com>"

# Make sure the package repository is up to date.
RUN apk update

# Upgrade libssl3 from 3.0.7-r0 to 3.0.7-r2 to fix CVE-2022-3996
RUN apk upgrade libssl3 libcrypto3

# Install Trivy Scanner and enable server.
COPY --from=aquasec/trivy:0.35.0 /usr/local/bin/trivy /usr/local/bin/trivy

EXPOSE 10000

ENTRYPOINT ["/usr/local/bin/trivy"]

CMD ["server"]