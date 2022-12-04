#!/usr/bin/env bash

# Read envs from .env file and export to shell
export $(cat .env | sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g" | xargs)

terraform -chdir=./terraform-modules/aws/blog plan
terraform -chdir=./terraform-modules/aws/blog apply -auto-approve
