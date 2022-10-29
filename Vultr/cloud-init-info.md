# Cloud Init

This is a way to run scripts or yaml configuration files when a new instance is starting up.
You can add packages, run arbitrary scripts, and configure users with authorized keys.
For me, adding users with keys is going to be the most useful. I'll still have to configure
the ssh settings, but this is a big plus.

- [Vultr cloud-init docs](https://www.vultr.com/docs/how-to-deploy-a-vultr-server-with-cloudinit-userdata/#What_is_cloud_init_)
- [cloud-init user config example](https://github.com/canonical/cloud-init/blob/main/doc/examples/cloud-config-user-groups.txt)

Note that you can add a user's password. This is not a plain text password, this is a hash. While
true, this is a security risk. I think it's best to not do this. If I can create a user without
a password and then set it, that would be ideal. What I would really like to do is just
deploy a couple of things:

- add my host public key somewhere on the file system so it can be added to authorized_keys.
- create a new user and home directory. I'll set the password the first time I log in.
This is just a script.
  - Along with that, I can have zsh be installed, and I can set the new user's shell to zsh
  so that it will be there the first login.
- Install things like git, curl if they're not installed.
- Add .vimrc file to root
- When I get more advanced, start working into a more complete setup with oh-my-zsh, neovim,
pyenv, node version manager, etc.

