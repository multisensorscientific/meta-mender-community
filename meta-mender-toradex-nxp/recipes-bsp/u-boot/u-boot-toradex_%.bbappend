PROVIDES += "${@bb.utils.contains('MENDER_FEATURES_ENABLE', 'mender-uboot', 'u-boot', '', d)}"
RPROVIDES_${PN} += "${@bb.utils.contains('MENDER_FEATURES_ENABLE', 'mender-uboot', 'u-boot', '', d)}"

MENDER_UBOOT_AUTO_CONFIGURE = "1"
MENDER_UBOOT_AUTO_CONFIGURE_colibri-imx7 = "0"

FILESEXTRAPATHS_prepend_mender-uboot := "${THISDIR}/files:"
SRC_URI_append_mender-uboot_colibri-imx7 = " \
	file://0001-Set-default-display-resolution-to-800x480-WVGA.patch \
"
MENDER_UBOOT_PRE_SETUP_COMMANDS_mender-uboot_colibri-imx7 = "setenv fdtfile ${KERNEL_DEVICETREE}"

require recipes-bsp/u-boot/u-boot-mender.inc

SRC_URI_remove_mender-uboot = " \
    file://0003-Integration-of-Mender-boot-code-into-U-Boot.patch \
"
SRC_URI_append_mender-uboot = " \
    file://0001-toradex-Integration-of-Mender-boot-code-into-U-Boot.patch \
"

SRC_URI_append_mender-uboot_colibri-imx7 = " \
    file://0001-colibri-imx7-mender-manual-U-boot-integration.patch \
"

SRC_URI_append_mender-uboot_apalis-imx8 = " \
    file://0001-configs-toradex-board-specific-mender-integration.patch \
"
