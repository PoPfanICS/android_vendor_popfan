PRODUCT_BRAND ?= cyanogenmod

ifneq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/popfan/prebuilt/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-sonyericsson \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/popfan/prebuilt/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/cm/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/cm/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/popfan/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cm/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/cm/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/cm/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# This is CM!
PRODUCT_COPY_FILES += \
    vendor/cm/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
PRODUCT_PACKAGES += \
    ThemeManager \
    ThemeChooser \
    com.tmobile.themes

PRODUCT_COPY_FILES += \
       vendor/cm/config/permissions/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME \
    Superuser \
    Superuser.apk \
    su

PRODUCT_PACKAGES += \
    Apollo \
    SoundRecorder \
    LiveWallpapersPicker

# FLAC
PRODUCT_PACKAGES += libFLAC

PRODUCT_COPY_FILES += \
    device/semc/shakira/prebuilt/app/ClockWidgets.apk:system/app/ClockWidgets.apk \
    device/semc/shakira/prebuilt/app/Home.apk:system/app/Home.apk \
    device/semc/shakira/prebuilt/app/OnOffTools.apk:system/app/OnOffTools.apk \
    device/semc/shakira/prebuilt/app/PhotoWidget.apk:system/app/PhotoWidget.apk \
    device/semc/shakira/prebuilt/app/WeatherWidget.apk:system/app/WeatherWidget.apk \
    device/semc/shakira/prebuilt/app/WidgetPicker.apk:system/app/WidgetPicker.apk \
    device/semc/shakira/prebuilt/app/SRSPanel.apk:system/app/SRSPanel.apk \
    device/semc/shakira/prebuilt/app/Term.apk:system/app/Term.apk \
    device/semc/shakira/prebuilt/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/semc/shakira/prebuilt/etc/SRSAudioFilter.csv:system/etc/SRSAudioFilter.csv \
    device/semc/shakira/prebuilt/lib/soundfx/libsrsfx.so:system/lib/soundfx/libsrsfx.so \
    device/semc/shakira/prebuilt/lib/soundfx/libsrstb.so:system/lib/soundfx/libsrstb.so \
    device/semc/shakira/prebuilt/lib/libjackpal-androidterm3.so:system/lib/libjackpal-androidterm3.so \
    vendor/popfan/prebuilt/update-binary:obj/EXECUTABLES/updater_intermediates/updater
# Custom CM packages
PRODUCT_PACKAGES += \
    audio_effects.conf

# Extra tools in CM
PRODUCT_PACKAGES += \
    openvpn

PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/common

PRODUCT_VERSION_MAJOR = PoPfan
PRODUCT_VERSION_MINOR = ICS
PRODUCT_VERSION_MAINTENANCE = v

CM_NAME := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)
CM_VERSION := $(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)

PRODUCT_PROPERTY_OVERRIDES += ro.cm.name=$(CM_NAME) ro.cm.version=$(CM_VERSION)

