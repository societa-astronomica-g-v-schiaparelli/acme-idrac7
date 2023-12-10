# Usage:

## put this script in the deploy/ directory in the acme.sh root

# export DEPLOY_IDRAC_HOST="idrac.domain.com"
# export DEPLOY_IDRAC_PASS="idrac_pass"
# export DEPLOY_IDRAC_USER="idrac_user"

## Issue the cert, I use CF
# acme.sh --issue --dns dns_cf -d "idrac.domain.com" -k 2048
# acme.sh --deploy -d "idrac.domain.com"  --deploy-hook idrac


idrac_deploy() {
  _cdomain="$1"
  _ckey="$2"
  _ccert="$3"
  _cca="$4"
  _cfullchain="$5"

  Le_Deploy_idrac_user="$DEPLOY_IDRAC_USER"
  _savedomainconf Le_Deploy_idrac_user "$Le_Deploy_idrac_user"
  Le_Deploy_idrac_pass="$DEPLOY_IDRAC_PASS"
  _savedomainconf Le_Deploy_idrac_pass "$Le_Deploy_idrac_pass"
  Le_Deploy_idrac_host="$DEPLOY_IDRAC_HOST"
  _savedomainconf Le_Deploy_idrac_host "$Le_Deploy_idrac_host"

  docker run --rm -it -v $(dirname $_ckey):/config idracadm7 -r "$Le_Deploy_idrac_host" -u "$Le_Deploy_idrac_user" -p"$Le_Deploy_idrac_pass" sslkeyupload -t 1 -f /config/$(basename $_ckey)
  docker run --rm -it -v $(dirname $_cfullchain):/config idracadm7 -r "$Le_Deploy_idrac_host" -u "$Le_Deploy_idrac_user" -p"$Le_Deploy_idrac_pass" sslcertupload -t 1 -f /config/$(basename $_cfullchain)
  docker run --rm -it idracadm7 -r "$Le_Deploy_idrac_host" -u "$Le_Deploy_idrac_user" -p"$Le_Deploy_idrac_pass" racreset
}