#!/vendor/bin/sh

TMP_OEM_DIR="/tmp/ocm"
OEM_DIR="/ocm"

### CLEANUP
umount ${OEM_DIR} 2>/dev/null
umount ${TMP_OEM_DIR}/modem-config 2>/dev/null
umount ${TMP_OEM_DIR}/system-properties 2>/dev/null

rm -rf "${TMP_OEM_DIR}"

### CREATE TEMPORARY OEM
mkdir "${TMP_OEM_DIR}"
chmod 0755 "${TMP_OEM_DIR}"

### MOUNT OEM
mount --bind "${TMP_OEM_DIR}" "${OEM_DIR}"

### MOUNT MODEM-CONFIG
chmod 0755 "${OEM_DIR}/modem-config"

mount --bind /ocm/modem-config ${OEM_DIR}/modem-config
mount -o remount,bind,ro /ocm/modem-config ${OEM_DIR}/modem-config

### MOUNT SYSTEM-PROPERTIES
chmod 0755 "${OEM_DIR}/system-properties"

mount --bind /ocm/system-properties ${OEM_DIR}/system-properties
mount -o remount,bind,ro /ocm/system-properties ${OEM_DIR}/system-properties

### SET PROP FOR INIT
setprop ro.boot.oem.ready true

### DONE
exit 0
