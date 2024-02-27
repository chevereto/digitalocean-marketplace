# DigitalOcean Marketplace

> 🔔 [Subscribe](https://chv.to/newsletter) to don't miss any update regarding Chevereto.

[![Chevereto](LOGO.svg)](https://chevereto.com)

[![Community](https://img.shields.io/badge/chv.to-community-blue?style=flat-square)](https://chv.to/community)

This repository provides the Chevereto [DigitalOcean Marketplace](https://marketplace.digitalocean.com/apps/chevereto?refcode=f800a079f4f1) application.

## Install Packer

Install [Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli):

* Ubuntu

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer
```

* macOS

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/packer
```

Init packer:

```sh
packer init .
```

## Running

Provide [DigitalOcean's PAT](https://docs.digitalocean.com/reference/api/create-personal-access-token/):

```sh
export DIGITALOCEAN_API_TOKEN=token_here
```

Run:

```sh
packer build marketplace-image.json
```
