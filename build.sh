#!/bin/bash

# Written by antdking <anthonydking@gmail.com>
# credits to Rashed for the base of zip making
# credits to the internet for filling in else where

echo "this is an open source script, feel free to use and share it"

daytime=$(date +%d"-"%m"-"%Y"_"%H"-"%M)

location=.
vendor=lge

# changed Ron "Readded options. This have hazel board as well" 05/02/13
if [ -z $target ]; then
echo "choose your target device"
echo "1) p350"
echo "2) c500"
read -p "1/2: " choice
case "$choice" in
1 ) export target=p350 ; export defconfig=cyanogenmod_p350_defconfig;;
2 ) export target=c500 ; export defconfig=cyanogenmod_hazel_defconfig;;
* ) echo "invalid choice"; sleep 2 ; ./build.sh;;
esac
fi # [ -z $target ]

# Ron Change "Read current kernel version"
export cver=`grep "^CONFIG_LOCALVERSION" $kh.config`

if [ "$-PecanCM-cm-10.1" ]; then
	export version="cm-10.1"
elif [ "-PecanCM-cm-10" ]; then
	export version="cm-10.1"
elif [ "-PecanCM-cm-9" ]; then
	export version="cm-9"
else
	export version="2.6.32.9"
fi

if [ -z $compiler ]; then
if [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]; then
export compiler=../arm-eabi-4.6/bin/arm-eabi-
elif [ -f arm-eabi-4.6/bin/arm-eabi-* ]; then # [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]
export compiler=arm-eabi-4.6/bin/arm-eabi-
else # [ -f arm-eabi-4.6/bin/arm-eabi-* ]
echo "please specify a location, including the '/bin/arm-eabi-' at the end "
read compiler
fi # [ -z $compiler ]
fi # [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]

cd $location
export ARCH=arm
export CROSS_COMPILE=$compiler
if [ -z "$clean" ]; then
read -p "do make clean mrproper?(y/n)" clean
fi # [ -z "$clean" ]
case "$clean" in
y|Y ) echo "cleaning..."; make clean mrproper;;
n|N ) echo "continuing...";;
* ) echo "invalid option"; sleep 2 ; build.sh;;
esac

echo "now building the kernel"

export starttime=`date +%s`

make $defconfig
make -j `cat /proc/cpuinfo | grep "^processor" | wc -l` "$@"

## the zip creation
if [ -f arch/arm/boot/zImage ]; then

mkdir builds 
rm -f zip-creator/kernel/zImage
rm -rf zip-creator/system/

# change by keyur2maru(keyur2maru@gmail.com) "Remove old Kernel zip" 08/02/13
cp zip-creator/PecanCM* builds/    
rm -rf zip-creator/PecanCM*


# changed antdking "clean up mkdir commands" 04/02/13
mkdir -p zip-creator/system/lib/modules

cp arch/arm/boot/zImage zip-creator/kernel

# changed antdking "now copy all created modules" 04/02/13
# modules
find . -name *.ko | xargs cp -a --target-directory=zip-creator/system/lib/modules/

export endtime=`date +%s`

zipfile="PecanCM.$version-$target-$daytime.zip"
cd zip-creator

rm -f *.zip
zip -r $zipfile * -x *kernel/.gitignore*

echo "zip saved to zip-creator/$zipfile"

else # [ -f arch/arm/boot/zImage ]
echo "The Build Failed So a Zip won't be Created"
fi # [ -f arch/arm/boot/zImage ]

echo "Building time: $(($endtime-$starttime)) seconds"
