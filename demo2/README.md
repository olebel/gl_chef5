### Install Chef
https://docs.chef.io/install_omnibus.html

```bash
ssh user@host 'curl -LO https://omnitruck.chef.io/install.sh && sudo bash ./install.sh -v 12.19.36'
```
### Create chef directories
```bash
ssh user@host 'sudo mkdir -p /var/chef/cache /var/chef/cookbooks'
```

### Resolve dependencies and save them in some folder
https://docs.chef.io/berkshelf.html#berks-vendor
```bash
cd
# We will store our cookbooks here
mkdir ~/cookbooks
# Get main cookbook from git.
git clone http://github.com/my_user/my_cookbook.git
cd my_cookbook
# Resolve dependencies. This will install cookbook in Berkshelf cache
berks install
# Store all depedencies in some folder
berks vendor ~/cookbooks
```
### Copy code to machine
```bash
# Tar dependencies , for faster scp:
cd
tar -czf archive.tar.gz cookbooks
# Transfer code to the node:
scp archive.tar.gz user@host:~
# Extract code to /var/chef/cookbooks directory
ssh user@host 'sudo tar -zxf archive.tar.gz -C /var/chef'
```

### chef-solo run!
```bash
ssh user@host "sudo chef-solo -o 'recipe[my_cookbook]'"
```

##### Inspired by
https://github.com/chef-cookbooks/chef-server installation recommendations
