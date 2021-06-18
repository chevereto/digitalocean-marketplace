**In addition to the package installation, this one-click deploy also**

- Enables the UFW firewall to allow only SSH (port 22, rate limited), HTTP (port 80), and HTTPS (port 443) access.
- Sets the MySQL root password.
- Sets up the debian-sys-maint user in MySQL so the system’s init scripts for MySQL will work without requiring the MySQL root user password.

**Chevereto Server Details**

Chevereto installer will be available at this URL:

[http://your_droplet_public_ipv4/installer.php](http://your_droplet_public_ipv4/installer.php)

After you finish the installation, your Chevereto website will be accessible at:

[http://your_droplet_public_ipv4/](http://your_droplet_public_ipv4/)

This is an Apache HTTP server based provisioning. PHP runs with `mod_php` using `mpm_prefork`. You can run Chevereto under any configuration, check our [documentation](https://chv.to/docs) for more information.

**Credentials**

The database credentials are at `/var/www/html/app/settings.php`.

**Extra-steps**

1. Provide HTTPS.

```sh
certbot --apache -d example.com -d www.example.com
```

1. Disable non-HTTPS access.

```sh
ufw delete allow 80/tcp
```

3. Secure MySQL.

```sh
mysql_secure_installation`
```

**Updates**

Chevereto can update itself, simply  open [http://your_droplet_public_ipv4/dashboard](http://your_droplet_public_ipv4/dashboard) and click "check for updates" button.
