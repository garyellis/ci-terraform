ci-terraform
============

A docker build environment for terraform development

Usage
-----
```
docker run --rm -t ci-terraformer:develop /bin/bash -c 'tfenv use 0.8.7 && terraform version'
docker run --rm -t ci-terraformer:develop /bin/bash -c 'tfenv use 0.11.6 && terraform version'

# run terraform plan on a module
docker run \
    --rm
    -v $(pwd)/spoke1-vpc:/opt/spoke1-vpc:rw \
    -v $HOME/.aws:/root/.aws:ro \
    ci-terraformer:develop \
    /bin/bash -c 'tfenv use 0.11.6 && cd /opt/spoke1-vpc && terraform init && terraform plan'
```
