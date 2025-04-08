# https://developer.nvidia.com/embedded/jetpack-archive
MAJOR=36
MINOR=4.3
L4T_RELEASE_PACKAGE=Jetson_Linux_R${MAJOR}.${MINOR}_aarch64.tbz2
SAMPLE_FS_PACKAGE=Tegra_Linux_Sample-Root-Filesystem_R${MAJOR}.${MINOR}_aarch64.tbz2
RELEASE_ADDR=https://developer.download.nvidia.com/embedded/L4T/r${MAJOR}_Release_v${MINOR}/release

wget ${RELEASE_ADDR}/${L4T_RELEASE_PACKAGE}
wget ${RELEASE_ADDR}/${SAMPLE_FS_PACKAGE}

tar xf ${L4T_RELEASE_PACKAGE}
sudo tar xpf ${SAMPLE_FS_PACKAGE} -C Linux_for_Tegra/rootfs/

cd Linux_for_Tegra/ \
    && sudo ./apply_binaries.sh \
    && sudo ./tools/l4t_flash_prerequisites.sh

# STORAGE_DEVIVE=sda1  # USB Memory or microSD
STORAGE_DEVIVE=nvme0n1p1  # NVMe SSD

# BOARD=p3737-0000+p3701-0000-maxn  # Jetson AGX Orin DK MAXN
# BOARD=p3509-a02+p3767-0000  # Jetson OrinNX + XavierNX DK
BOARD=jetson-orin-nano-devkit  # Jetson Orin Nano DK

# cd Linux_for_Tegra && \
sudo ./tools/kernel_flash/l4t_initrd_flash.sh --external-device ${STORAGE_DEVIVE} \
    -c tools/kernel_flash/flash_l4t_external.xml -p "-c bootloader/generic/cfg/flash_t234_qspi.xml" \
    --showlogs --network usb0 ${BOARD} internal
