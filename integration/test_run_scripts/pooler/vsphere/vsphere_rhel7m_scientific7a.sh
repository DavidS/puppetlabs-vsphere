#!/bin/bash
SCRIPT_PATH=$(pwd)
BASENAME_CMD="basename ${SCRIPT_PATH}"
SCRIPT_BASE_PATH=`eval ${BASENAME_CMD}`

if [ $SCRIPT_BASE_PATH = "vsphere" ]; then
  cd ../../../
fi

export pe_dist_dir=http://pe-releases.puppetlabs.lan/3.8.1/
export GEM_SOURCE=http://rubygems.delivery.puppetlabs.net
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

#bundle install --without acceptance development test --path .bundle/gems

bundle exec beaker \
  --config test_run_scripts/pooler/configs/rhel7m-scientific7a-x86_64.cfg \
  --debug \
  --pre-suite pre-suite \
  --test tests \
  --keyfile ~/.ssh/id_rsa-acceptance \
  --load-path lib \
  --preserve-host \
  --timeout 360

#rm -rf .bundle
