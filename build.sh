sudo apt update
sudo apt upgrade -y

## LFS CHAPTER 2
# redirect sh to bash
sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

sudo apt install -y build-essential git bison m4 gawk texinfo

export LFS=/mnt/lfs

