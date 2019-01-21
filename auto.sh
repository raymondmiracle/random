git clone https://github.com/raymondmiracle/Toolchain ~/Toolchain
export ARCH=arm64
export CROSS_COMPILE=~/Toolchain/bin/aarch64-linux-android-
mkdir output
make -C $(pwd) O=output k606kd_defconfig
make -j32 -C $(pwd) O=output
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage 
zip -r KERNEL-V1.1.zip *
