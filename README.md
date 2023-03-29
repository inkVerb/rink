# Rink server
For system control of Vultr-hosted [verbers](https://github.com/inkverb/verb)

Prerequisites:
1. You need snapshots based on verbers prepared with `make-verber-laemp`
2. Those snapshots must have SSH keys created on this server
  - Instructions for these can be found in steps 0-4 in the [Official Cheat Sheet](https://github.com/inkVerb/verb/blob/main/dev/official-cheat-sheet.md)
3. You need to create a rink server, then two rink-auto-created NS servers (three servers total)
  - On the rink server: The original file `verb/conf/inklists/inkdnsnameservers` should be replaced with `rink/inst/inkdnsnameservers`
    - `verb/conf/inklists/inkdnsnameservers` will remain unique on each of the three rink servers
  - Only go as far to install `verb/inst/make-preverber` on the main "Rink" server, then complete setup and the other two nameservers by properly installing this `rink` repo
  - Instructions for the final `rink` installation can be found from step 5 in the [Official Cheat Sheet](https://github.com/inkVerb/verb/blob/main/dev/official-cheat-sheet.md)

## SSH Keys

This may help to ssh from your local machine to this rink:

| **~/.ssh/config** :

```console
Host your_rink_verber_nickname
  Hostname ip4.to.rink.srvr
  User root
  Port 1222
  IdentityFile /root/.ssh/Vultr_Rink
```

To set this, on your local machine...

```console
cat <<EOF >> ~/.ssh/config
Host rink
  Hostname ip4.to.rink.srvr
  User root
  Port 1222
  IdentityFile ~/.ssh/Vultr_Rink
EOF
```

On the rink VPS...

Create the keys:

```console --noconfirm
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
sed -i "s/#PermitRootLogin.*/PermitRootLogin prohibit-password/" /etc/ssh/sshd_config
systemctl restart sshd
mkdir -p /root/.ssh
ssh-keygen -t rsa -N "" -f /root/.ssh/Vultr_Rink
cat /root/.ssh/Vultr_Rink.pub
```

Copy and paste the pub key into your snapshot template...

On the to-become-snapshot Verber VPS:

```console
cat <<EOF >> /root/.ssh/authorized_keys
Vultr_Rink.pub_cat_output_long_key
EOF
```

## Install Rink:

```console
cd /opt
git clone https://github.com/inkverb/rink
cd rink/inst
./setup YOUR_VULTR_API_KEY
cd /opt/rink/run
./setsnapshot theSnapshotIDyouWillUse4newVPSinstances laemp1
./setport portnumber
./setupnsrinkssh
./setkey Vultr_Rink
./setrinknames inkisaverb.com rink ns1 ns2 444.444.444.444 11:0:0:11 rink rink1 rink2 America/Chicago ord
```

## Finalize installation
```
cd rink/run
./setuprinkns
```

## Create a controlled verber
Note `1gb` is a nickname for the `vc2-1c-1gb` plan
Note `2gb` is a nickname for the `vc2-1c-2gb` plan
Note these nicknames don't need to be used, you can use original Vultr plan names
```console
./addvps name ink john vc2-1c-1gb sjc laemp1
```

## Import an existing verber to be controlled
Note the public key of the rink must be installed on this existing verber:
- The file: `@existingVerber` `/root/.ssh/authorized_keys`
- Must contain: `@Rink` `/root/.ssh/Vultr_Rink_Key.pub`
- This should be no problem if the existing verber was created according to the [Official Cheat Sheet](https://github.com/inkVerb/verb/blob/main/dev/official-cheat-sheet.md)
```console
./importvps name ink john s0mElong-An6Cr7z3-ID
```

## Scripts

Scripts are located in `rink/run/`

Descriptions and usage are in the file and most can be seen via `head /opt/rink/run/somescript`
