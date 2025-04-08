# jetson_dev

## write image
```bash
lsusb

# NVIDIA Corp. APX

cd l4t_image
sh flash_l4t.sh
#  auto reboot
```

```bash
cd setup
sh install_apt-fast.sh
sh install_docker.sh
sh install_jetpack.sh

sudo gpasswd -a $USER docker

# check
docker run --rm -it --runtime nvidia dustynv/pytorch:2.6-r36.4.0-cu128 python3 -c "import torch; print(torch.cuda.is_available())"
```
