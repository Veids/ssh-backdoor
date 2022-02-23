# SSH BACKDOOR - A portable open-ssh server

## Disclaimer

This is a fork of [NinjaJc01](https://github.com/NinjaJc01/ssh-backdoor)'s project, all credits belong to him. 
The purpose here is to try to improve and maintain his beautiful project, not to steal his stuff.

## Context

Having a reverse-shell on a machine (in a legal situation of course) is good, but a `ctrl+c` can happen quickly and it's quite annoying.

And when you do manage to get a shell, it's often with a user who doesn't have the rights to generate a private/public key pair in his home directory.

So, while wandering around on Github, I came across this tool, made by a developer from TryHackMe.

After testing it, I found it absolutely beautiful.
Besides it is written in go, a language I would like to learn.
So this project is the opportunity for me to learn it and to contribute to his project.

## How to use

1. Create an hidden directory (optionnal)
2. Download the `backdoor` binary according the target machine archa and distro, then upload it.
    >The binary has only been tested on x86_64 machines. Feel free to build for the other archs :)

3. Generate the `id_rsa` key pair in the directory you want.
    ```bash
    user@victim ssh-keygen -f ./id_rsa
    ```
    > Password protected private keys are not supported
4. You are ready to go ! Just launch `./backdoor` with the options you like.
    >By default, password is `password` and listening port is `2222`.
    >So if you are on a shared machine, you should use a random/strong password.
    >Also, don't forget to delete your traces by deleting the binary.

### Optional options

`-a`, `--hash` : Password hash to be verified.\
`-p`, `--port` : Specify port to bind.\
`-k`, `--key` : Path to private key.\
`-i`, `--interface` : Interface to listen on.\
`-p`, `--fingerprint` : SSH Fingerprint, excluding the SSH-2.0- prefix.\
`-r`, `--rand-pass` : Generate a random password of a given length.

## Demo

### Linux


## Known ssh issue

If you encounter this type of error : 
```
Unable to negotiate with <ip> port <port>: no matching host key type found. Their offer: ssh-rsa
```

You have to append this to your ssh command : `-oHostKeyAlgorithms=+ssh-rsa`

# List of compatibles arch/distro

> Only AMD64 (x86_64) for the moment

- Debian
- Ubuntu
- Centos
- Fedora
- Manjaro
- Alpine
- Archlinux

## To do

- [x] : Add a random password generator
- [ ] : Add Windows compatibility
- [ ] : Build for more platforms