### Install Chef
https://docs.chef.io/install_omnibus.html
### Establish key-based authentication
```bash
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
scp ~/.ssh/id_rsa.pub chef.local:~
ssh chef.local 'cat ~/id_rsa.pub >> ~/.ssh/authorized_keys'
```
### Install Chef-Client
```bash
ssh chef.local 'curl -LO https://omnitruck.chef.io/install.sh && sudo bash ./install.sh -v 12.19.36'
ssh chef.local 'sudo mkdir -p /var/chef/cache /var/chef/cookbooks'
```

### Resolve dependencies and save them in some folder
https://docs.chef.io/berkshelf.html#berks-vendor
```bash
cd
mkdir ~/cookbooks
git clone http://github.com/olebel/gl_chef_server.git
cd gl_chef_server
berks install
berks vendor ~/cookbooks
cd
tar -czf archive.tar.gz cookbooks
```
### Copy code to machine and run
```bash
scp archive.tar.gz chef.local:~
ssh chef.local 'sudo tar -zxf archive.tar.gz -C /var/chef'
ssh chef.local "sudo chef-solo -o 'recipe[gl_chef_server]'"
```

##### Inspired by
https://github.com/chef-cookbooks/chef-server installation recommendations
