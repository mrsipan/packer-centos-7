auth --enableshadow --passalgo=sha512
bootloader --location=mbr --append="console=ttyS0 crashkernel=auto rhgb quiet audit=1"
zerombr
text
firewall --disable
firstboot --disable
keyboard us
lang en_US
selinux --permissive
skipx
timezone UTC
install
network --bootproto=dhcp --onboot=on --hostname=Unnamed
reboot
# url --mirrorlist="http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=os"
cdrom
logging --level=debug

# set passwd
rootpw --iscrypted $6$inmortal$v18Pp2PNcZOC9msbh3otgolrZdX6HkSAV9FBEMqLMRc4lYf93hOe4I3JYE6DhPAWmKJ.ULlvei7IsOl7hD.dr/

# partition code
clearpart --all --initlabel
part / --fstype="xfs" --size=1 --asprimary --grow

%packages --excludedocs --ignoremissing
bash
bind-utils
bzip2
chkconfig
chrony
curl
dhclient
dmidecode
e2fsprogs
iputils
kbd
kernel
lsof
lvm2
man
openssh
passwd
policycoreutils
rootfiles
selinux-policy
smartmontools
strace
sudo
vim-enhanced
which
yum-plugin-tsflagsgit
yum-utils
yum-versionlock
-cups-libs
-ed
-freetype
-iscsi-initiator-utils
-kbd
-kudzu
-libX11
-prelink
-sendmail
-setserial
-smartmontools
-udftools
-xorg-x11-filesystem

%end #%packages

%post --log=/root/ks-post-install.log

# Harden sshd, permit root login
cat <<'EOF' >/etc/ssh/sshd_config
Protocol 2
SyslogFacility AUTHPRIV
#PermitRootLogin no
PermitRootLogin yes
#PasswordAuthentication no
PasswordAuthentication yes
PermitEmptyPasswords no
ChallengeResponseAuthentication no
GSSAPIAuthentication yes
GSSAPICleanupCredentials yes
UsePAM yes
X11Forwarding no
X11DisplayOffset 10
Subsystem sftp /usr/libexec/openssh/sftp-server

EOF

cat <<'EOF' >/etc/ssh/ssh_config
Host *
  ForwardAgent yes
  ForwardX11 yes
  GSSAPIAuthentication yes
  ForwardX11Trusted yes

EOF

%end #%post
