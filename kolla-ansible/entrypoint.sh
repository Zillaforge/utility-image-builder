#!/bin/bash

function check_err () {
  if [ "$1" != "0" ]; then exit $1; fi;
}

CONFIG_DIR="/etc/kolla"
CONTAINER_NAME="kolla_c"
BASHRC="/root/.bashrc"

if [ ! -d $CONFIG_DIR ]; then
  mkdir -p $CONFIG_DIR
  echo "create folder $CONFIG_DIR"
fi

if [ ! -f "$CONFIG_DIR/passwords.yml" ]; then
  cp /kolla-ansible/etc/kolla/passwords.yml "$CONFIG_DIR/passwords.yml"
  check_err $?
  echo "copy empty passwords.yaml to $CONFIG_DIR"
  kolla-genpwd
  check_err $?
  echo "passwords.yaml filled."
else
  echo  "password.yaml already existed."
fi

if [ ! -f "$CONFIG_DIR/globals.yml" ]; then
  cp /kolla-ansible/etc/kolla/globals.yml "$CONFIG_DIR/globals.yml"
  check_err $?
  echo "copy globals.yaml to $CONFIG_DIR"
else
  echo "globals.yaml already existed";
fi

if [ ! -f "$CONFIG_DIR/inventory" ]; then
  cp /kolla-ansible/ansible/inventory/multinode "$CONFIG_DIR/inventory"
  check_err $?
  echo "copy inventory to $CONFIG_DIR"
else
  echo "inventory already existed";
fi

grep -q "PS1=\"(${CONTAINER_NAME})" "$BASHRC" || \
echo "export PS1=\"(${CONTAINER_NAME}) \u@\h:\w# \"" >> "$BASHRC"


/bin/sleep infinity

