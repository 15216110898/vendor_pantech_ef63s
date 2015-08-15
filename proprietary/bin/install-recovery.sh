#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11051008 d0538cdaf6d5a1d69b66173eb7198e83c2b560af 8804352 0737eb34569bc192829c2b7767b0727d6998c1b4
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:11051008:d0538cdaf6d5a1d69b66173eb7198e83c2b560af; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:8804352:0737eb34569bc192829c2b7767b0727d6998c1b4 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery d0538cdaf6d5a1d69b66173eb7198e83c2b560af 11051008 0737eb34569bc192829c2b7767b0727d6998c1b4:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
