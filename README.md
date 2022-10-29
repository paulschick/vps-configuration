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

Update 10/29/2022

Create a new user with home directory, using zsh, in sudoers group

```sh
useradd -m -s /usr/bin/zsh -G sudo paul
passwd paul
```

Then copy authorized_keys to this user's directory so you can ssh directly in.
But, you have to set the permissions on this stuff, otherwise the key won't work.

```ssh
mkdir /home/paul/.ssh
cp .ssh/authorized_keys /home/paul/.ssh/authorized_keys
chmod 700 /home/paul/.ssh
chown -R paul:paul /home/paul/.ssh
```
