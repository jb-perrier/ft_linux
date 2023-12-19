This project will create a custom linux distribution, we will use Virtualbox.

Create a virtual machine and install ubuntu on it, allocate 35 gigabytes.
Allocate a second storage disk with 40 gigabytes and add it to the virtual machine.
This storage will contains ur custom linux image.

![Virtualbox storage](https://github.com/jb-perrier/ft_linux/blob/main/virtualbox-storage.jpg?raw=true)

Once your VM is correctly setup, start the ubuntu VM and execute this script :

```sh
sudo apt update
sudo apt install -y curl
curl -o ~/start.sh https://github.com/jb-perrier/ft_linux/start.sh
sudo chmod +x ~/start.sh
bash ~/start.sh
```

Useful commands :
```sh
# show available disks
sudo fdisk -l
```