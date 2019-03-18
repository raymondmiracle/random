git clone https://github.com/raymondmiracle/Toolchain /toolchain
git clone https://github.com/raymondmiracle/anykernel
export ARCH=arm64
export CROSS_COMPILE=$pwd/toolchain/bin/aarch64-linux-android-
mkdir output
make -C $(pwd) O=output k606kd_defconfig
make -j32 -C $(pwd) O=output
cp -r output/arch/arm64/boot/Image.gz-dtb anykernel/
cd anykernel
mv Image.gz-dtb zImage 
zip -r9 kernel *
