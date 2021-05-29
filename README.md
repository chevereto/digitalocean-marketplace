# DigitalOcean Marketplace

This repository provides the Chevereto [DigitalOcean Marketplace](https://github.com/digitalocean/marketplace-partners) application.

Make `001-onboot.sh` executable.

```sh
chmod +x files/var/lib/cloud/scripts/per-instance/001-onboot.sh
```

Then run:

```sh
packer build marketplace-image.json
```
