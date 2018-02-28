#!/bin/bash

# we still need to setup the docker build itself, pass name to run here and upload image to a registry, but
# in the short term we'll just build here
image_name=ci-terraform
script_pwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(cd $script_pwd/../../ && docker build . -t $image_name)

container=$(docker run --rm -d -v $script_pwd/fixtures/default:/opt/default -t $image_name)

inspec exec $script_pwd/default -t docker://$container

docker kill $container
