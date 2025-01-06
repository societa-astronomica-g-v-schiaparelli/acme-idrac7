# Dockerfile for the idracadm7 based on AlmaLinux9
# Copyright (c) 2023-2025 Societa` Astronomica G.V. Schiaparelli

FROM almalinux:9

RUN dnf install -y https://linux.dell.com/repo/hardware/DSU_24.11.11/os_dependent/RHEL9_64/srvadmin/srvadmin-argtable2-11.0.0.0-5268.el9.x86_64.rpm https://linux.dell.com/repo/hardware/DSU_24.11.11/os_dependent/RHEL9_64/srvadmin/srvadmin-hapi-11.0.0.0-5268.el9.x86_64.rpm https://linux.dell.com/repo/hardware/DSU_24.11.11/os_dependent/RHEL9_64/srvadmin/srvadmin-idracadm7-11.0.0.0-5268.el9.x86_64.rpm
RUN ln -s /usr/lib64/libssl.so.3 /usr/lib64/libssl.so

ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
