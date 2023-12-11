# acme.sh integration with iDRAC7

1. Build the container
```bash
docker build -t idracadm7 .
```
2. Download and copy `idrac.sh` in in the `deploy/` directory in the `acme.sh` root
3. Generate the certificate and deploy it
```bash
export DEPLOY_IDRAC_HOST="idrac.domain.com"
export DEPLOY_IDRAC_PASS="idrac_pass"
export DEPLOY_IDRAC_USER="idrac_user"
acme.sh --issue --dns dns_cf -d "idrac.domain.com" -k 2048
acme.sh --deploy -d "idrac.domain.com"  --deploy-hook idrac
```

## Credits
https://github.com/kroy-the-rabbit/acme_idrac_deployment