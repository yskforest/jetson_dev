# jetson_dev

## write image
```bash
# Forch recovery modeにし、USB接続
lsusb

# NVIDIA Corp. APX　表示でOK

cd l4t_image
sh flash_l4t.sh
# 自動でRebootし、ディスプレイを接続して初期設定を行う
```

## Jetsonでの初期設定
```bash
cd setup
sh install_apt-fast.sh
sh install_docker.sh
sh install_jetpack.sh

sudo gpasswd -a $USER docker

# reboot

# check
docker run --rm -it --runtime nvidia dustynv/pytorch:2.6-r36.4.0-cu128 python3 -c "import torch; print(torch.cuda.is_available())"
```
