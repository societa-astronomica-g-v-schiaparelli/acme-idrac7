# Dockerfile for the idracadm7 based on the RHEL 9 UBI
# Copyright (c) 2023 Societa` Astronomica G.V. Schiaparelli

FROM registry.access.redhat.com/ubi9/ubi:latest

RUN curl -O https://linux.dell.com/repo/hardware/dsu/bootstrap.cgi
RUN echo "y" | bash bootstrap.cgi
RUN dnf install -y srvadmin-idracadm7
RUN ln -s /usr/lib64/libssl.so.3 /usr/lib64/libssl.so

ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]