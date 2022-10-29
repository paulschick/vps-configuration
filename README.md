# vps-configuration

Configuration files and scripts to be used with Ubuntu VPS machines.

## User Management

- [User management guide](https://www.makeuseof.com/user-management-linux-guide/)
- [Add user to sudoers](https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/)

```sh
# -m creates the home directory
sudo useradd -m paul
sudo passwd paul
sudo usermod -aG sudo paul

# if you didn't create home dir
sudo mkhomedir_helper username

# alternative way to create home
mkdir /home/paul
chown paul:paul /home/paul
```

