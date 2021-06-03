build:
	packer build marketplace-image.json

validate:
	packer validate marketplace-image.json

update-scripts:
	curl -o common/scripts/90-cleanup.sh https://raw.githubusercontent.com/digitalocean/marketplace-partners/master/scripts/90-cleanup.sh
	curl -o common/scripts/99-img-check.sh https://raw.githubusercontent.com/digitalocean/marketplace-partners/master/scripts/99-img-check.sh