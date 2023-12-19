##
# All numbers relates to chapters from https://www.linuxfromscratch.org/lfs/view/stable/
##

sudo apt update
sudo apt upgrade -y

## 2.2
# redirect sh to bash
sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

sudo apt install -y build-essential git bison m4 gawk texinfo

## 2.5
# create file system on second disk
mkfs -v -t ext4 /dev/sdb2
mkswap /dev/sdb3

## 2.6
export LFS=/mnt/lfs

## 2.7
mkdir -pv $LFS
mount -v -t ext4 /dev/sdb2 $LFS
/sbin/swapon -v /dev/sdb3

## 3.1
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

wget https://www.linuxfromscratch.org/lfs/view/stable/wget-list-sysv
wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources
wget https://www.linuxfromscratch.org/lfs/view/stable/md5sums --directory-prefix=$LFS/sources

pushd $LFS/sources
  md5sum -c md5sums
popd

chown root:root $LFS/sources/*

## 4.2
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools

## 4.3
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

passwd lfs #tyty

chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac

su - lfs