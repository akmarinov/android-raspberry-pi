#!/bin/bash -e

trap 'echo -e "\nbuild.sh interrupted"; exit 1' SIGINT

TA_BUILD_VARIANT=${TA_BUILD_VARIANT:-userdebug}
if [[ ! "${TA_BUILD_VARIANT}" =~ ^(user|userdebug)$ ]]; then
    echo "TA_BUILD_VARIANT must be 'user' or 'userdebug' (got '${TA_BUILD_VARIANT}')" >&2
    exit 1
fi
echo "Build variant: ${TA_BUILD_VARIANT}"

echo Building the Android
pushd aosptree
. build/envsetup.sh
lunch "tesla_android_cm4-${TA_BUILD_VARIANT}"
make images -k || make images -j1
make sdcard
make otapackage
