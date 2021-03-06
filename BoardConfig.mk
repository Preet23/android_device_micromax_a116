# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

-include vendor/mediatek/mt6589/BoardConfigVendor.mk

# MT6589 Specific GPS Include
TARGET_SPECIFIC_HEADER_PATH := device/mediatek/mt6589/include

# MT6589 Platform
TARGET_BOARD_PLATFORM := mt6589
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

# MT6589 Boot-Loader
TARGET_BOOTLOADER_BOARD_NAME := mt6589

# MT6589 Default FileSystem
TARGET_USERIMAGES_USE_EXT4 := true

# HACK: Build ROM Without Sparsed Images
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# MT6589 Kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# MT6589 16GiB Partitions Size
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 943718400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1207959552
BOARD_FLASH_BLOCK_SIZE := 131072

# MT6589 Boot Image Building
TARGET_PREBUILT_KERNEL := device/mediatek/mt6589/kernel
BOARD_CUSTOM_BOOTIMG_MK := device/mediatek/mt6589/bootimg.mk
BOARD_MKBOOTIMG_ARGS := --board 1419997733
BOARD_CUSTOM_BOOTIMG := true

# MT6589 Flags
TARGET_KMODULES := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# MT6589 EGL
BOARD_EGL_CFG := device/mediatek/mt6589/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# MediaTek MT6589 HardWare
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

# MT6589 Offline Charging: Thanks to @fire855
ADDITIONAL_DEFAULT_PROPERTIES += ro.mount.fs=EXT4

# MT6589 RIL
BOARD_RIL_CLASS := ../../../device/mediatek/mt6589/ril/

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

# MT6589 Wi-Fi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/mediatek/mt6589/bluetooth

# MT6589 CWM
TARGET_RECOVERY_FSTAB := device/mediatek/mt6589/rootdir/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_SEPOLICY_DIRS := \
       device/mediatek/mt6589/sepolicy

BOARD_SEPOLICY_UNION := \
       aee_aed.te \
       app.te \
       batterywarning.te \
       bootanimation.te \
       device.te \
       domain.te \
       file_contexts \
       init.te \
       kernel.te \
       logwrapper.te \
       mediaserver.te \
       mtk_device.te \
       netd.te \
       pvrsrvctl.te \
       resmon.te \
       servicemanager.te \
       surfaceflinger.te \
       system.te \
       system_server.te \
       untrusted_app.te  
