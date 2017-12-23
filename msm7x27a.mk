#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The GPS configuration appropriate for this device.
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

MSM7X27_PATH := device/huawei/msm7x27a-common
NATIVE_PATH := frameworks/native/data/etc

DEVICE_PACKAGE_OVERLAYS += $(MSM7X27_PATH)/overlay

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi



# Packages
PRODUCT_PACKAGES += \
	audio.primary.msm7x27a \
	audio.a2dp.default \
	audio.usb.default \
	libaudioutils

# Display HAL
PRODUCT_PACKAGES += \
    gralloc.msm7x27a \
    copybit.msm7x27a \
    libqdMetaData \
    memtrack.msm7x27a

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw

PRODUCT_PACKAGES += \
	gps.msm7x27a
	
PRODUCT_PACKAGES += \
	camera.msm7x27a

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory \
	hwmac \
	make_ext4fs \
	setup_fs

# Music
PRODUCT_PACKAGES += \
	Music

#wifi
PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf

# Files
PRODUCT_COPY_FILES += \
	$(MSM7X27_PATH)/rootdir/init.huawei.rc:root/init.huawei.rc \
	$(MSM7X27_PATH)/rootdir/init.huawei.usb.rc:root/init.huawei.usb.rc \
	$(MSM7X27_PATH)/rootdir/ueventd.huawei.rc:root/ueventd.huawei.rc

PRODUCT_COPY_FILES += \
	$(MSM7X27_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	$(MSM7X27_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(MSM7X27_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(MSM7X27_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
	$(MSM7X27_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
	$(MSM7X27_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(MSM7X27_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
	$(MSM7X27_PATH)/configs/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \


PRODUCT_COPY_FILES += \
	$(MSM7X27_PATH)/idc/qwerty.idc:system/usr/idc/qwerty.idc \
	$(MSM7X27_PATH)/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
	$(MSM7X27_PATH)/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
	$(MSM7X27_PATH)/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
	$(MSM7X27_PATH)/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Permissions
PRODUCT_COPY_FILES += \
	$(NATIVE_PATH)/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	$(NATIVE_PATH)/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	$(NATIVE_PATH)/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	$(NATIVE_PATH)/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	$(NATIVE_PATH)/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	$(NATIVE_PATH)/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	$(NATIVE_PATH)/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	$(NATIVE_PATH)/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	$(NATIVE_PATH)/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	$(NATIVE_PATH)/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	$(NATIVE_PATH)/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	headset.hook.delay=500

PRODUCT_PROPERTY_OVERRIDES += \
	ro.bluetooth.remote.autoconnect=true \
	ro.bluetooth.request.master=true \
	ro.bt.bdaddr_path=/data/misc/bluedroid/bdaddr \
	ro.qualcomm.bluetooth.dun=true \
	ro.qualcomm.bluetooth.ftp=true

PRODUCT_PROPERTY_OVERRIDES += \
	debug.egl.recordable.rgba8888=1 \
	debug.composition.type=dyn \
	debug.hwc.dynThreshold=1.9 \
	persist.hwc.mdpcomp.enable=false \
	debug.mdpcomp.logs=0 \
	debug.gralloc.map_fb_memory=1 \
	debug.hwc.fakevsync=1 \
	ro.max.fling_velocity=12000 \
	ro.min.fling_velocity=8000 \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=241
	
# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes
    
# Data
PRODUCT_PROPERTY_OVERRIDES += \
    ro.use_data_netmgrd=true \
    persist.data.ds_fmc_app.mode=0
    
# Use Hardware Rendering
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=1

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heapsize=128m \
    dalvik.vm.heaptargetutilization=0.25 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m

PRODUCT_PROPERTY_OVERRIDES += \
	com.qc.hardware=true \
	dev.pm.dyn_sample_period=700000 \
	dev.pm.dyn_samplingrate=1 \
	ro.vendor.extension_library=/system/lib/libqc-opt.so

PRODUCT_PROPERTY_OVERRIDES += \
	ril.subscription.types=NV,RUIM \
	rild.libargs=-d/dev/smd0 \
	ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb \
	ro.vold.umsdirtyratio=30

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=eth0 \
	wifi.supplicant_scan_interval=60

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
	audio.gapless.playback.disable=true \
	audio.offload.disable=1

# Low RAM
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.low_ram=true \
	config.disable_atlas=true \
	persist.sys.force_highendgfx=true \
	ro.config.max_starting_bg=1 \
	ro.sys.fw.bg_apps_limit=8

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += security.perf_harden=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

# Strict mode
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1 \
    ro.HOME_APP_ADJ=1 \
    windowsmgr.max_events_per_sec=150 \
    ro.lge.proximity.delay=25 \
    mot.proximity.delay=25 \
    ro.kernel.android.checkjni=0 \
    persist.sys.purgeable_assets=1 \
    dalvik.vm.verify-bytecode=false \
    dalvik.vm.dexopt-flags=v=n,o=v \
    persist.android.strictmode=0 \
    persist.sys.scrollingcache=3 \
    persist.sys.composition.type=dyn \
    ro.ril.hep=1

# SIM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.factory.enable=0 \
    persist.radio.apm_sim_not_pwdn=1

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.enable-player=true \
	media.stagefright.enable-meta=false \
	media.stagefright.enable-scan=true \
	media.stagefright.enable-http=true \
	media.stagefright.enable-fma2dp=true \
	media.stagefright.enable-aac=true \
	media.stagefright.enable-qcp=true

PRODUCT_PROPERTY_OVERRIDES += \
	mm.enable.smoothstreaming=true \
	persist.sys.root_access=3

# Newer camera API isn't supported.
PRODUCT_PROPERTY_OVERRIDES += \
	camera2.portability.force_api=1

# Use ART small mode
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-filter=balanced \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.image-dex2oat-filter=speed

# ART properties
ADDITIONAL_DEFAULT_PROPERTIES += \
	dalvik.vm.dex2oat-Xms=8m \
	dalvik.vm.dex2oat-Xmx=96m \
	dalvik.vm.image-dex2oat-Xms=48m \
	dalvik.vm.image-dex2oat-Xmx=48m

$(call inherit-product, vendor/huawei/msm7x27a-common/msm7x27a-common-vendor.mk)
