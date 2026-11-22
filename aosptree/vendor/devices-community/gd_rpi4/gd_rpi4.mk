# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2020 Roman Stratiienko (r.stratiienko@gmail.com)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a72

# 64-bit only: Cortex-A72 supports AArch32 but the image ships no 32-bit libs;
# see glodroid_configuration/common/base/device.mk (core_64_bit_only.mk).
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_SUPPORTS_32_BIT_APPS := false

PRODUCT_BOARD_PLATFORM := broadcom
PRODUCT_NAME := gd_rpi4
PRODUCT_DEVICE := gd_rpi4
PRODUCT_BRAND := RaspberryPI
PRODUCT_MODEL := rpi4
PRODUCT_MANUFACTURER := RaspberryPiFoundation

UBOOT_DEFCONFIG := rpi_4_defconfig
ATF_PLAT        := rpi4

KERNEL_SRC       := glodroid/kernel/broadcom
KERNEL_DEFCONFIG := $(KERNEL_SRC)/arch/arm64/configs/android_rpi4_defconfig

KERNEL_FRAGMENTS := \
    $(LOCAL_PATH)/kernel.config \

KERNEL_DTB_FILE := broadcom/bcm2711-rpi-4-b.dtb

SYSFS_MMC0_PATH := emmc2bus/fe340000.mmc

RPI_CONFIG := $(LOCAL_PATH)/boot/config.txt

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/config.txt:$(TARGET_COPY_OUT_VENDOR_DLKM)/boot/config.txt

GD_NO_DEFAULT_MODEM := true

$(call inherit-product, $(LOCAL_PATH)/device.mk)
