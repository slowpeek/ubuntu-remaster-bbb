FROM ubuntu:22.04

COPY <<EOF /etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu/ jammy main universe
deb http://archive.ubuntu.com/ubuntu/ jammy-updates main universe
deb http://security.ubuntu.com/ubuntu/ jammy-security main universe
EOF

RUN <<EOF
apt-get update
apt-get install -y xorriso xxd file cpio squashfs-tools kmod lz4 xz-utils zstd pv wget
find /var/lib/apt/lists -mindepth 1 -delete

cd /usr/bin
wget https://raw.githubusercontent.com/slowpeek/unmkinitramfs-turbo/master/unmkinitramfs-turbo
wget https://raw.githubusercontent.com/slowpeek/ubuntu-remaster-bbb/master/ubuntu-remaster-bbb
chmod +x unmkinitramfs-turbo ubuntu-remaster-bbb
EOF

ENTRYPOINT ["ubuntu-remaster-bbb"]
