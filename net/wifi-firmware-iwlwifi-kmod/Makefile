BASEDIR=	${.CURDIR}/../wifi-firmware-kmod

FWDRV=		iwlwifi
FWSUBDIR=
#FWDRV_VERSION=	20240513
FWDRV_VERSION=	20241017

LICENSE_FILE=	LICENCE.iwlwifi_firmware
LICENSE_NAME=	Intel firmware license (${FWDRV})

WHENCE_REGEX=	iwlwifi -.*

# Run iwlwifi-generate-fw-list.sh according to description.

# The flavor/firmware lists below are generated by a script
# also helping to generate the fwget(8) definitions.
# { sys/contrib/dev/iwlwifi/zzz_fw_ports_fwget.sh }
#
# Note: we manually added (kept) some older versions (outside
# the generated template) to be able to support all branches.
#
### >>>

FWSUBS= \
	7000 \
	8000 \
	9000 \
	22000 \
	ax210 \
	bz

# Do not prefix with empty ${FWSUBDIR}/!
DISTFILES_7000= \
	iwlwifi-3160-17.ucode${DISTURL_SUFFIX} \
	iwlwifi-3168-29.ucode${DISTURL_SUFFIX} \
	iwlwifi-7260-17.ucode${DISTURL_SUFFIX} \
	iwlwifi-7265D-29.ucode${DISTURL_SUFFIX} \
	iwlwifi-7265-17.ucode${DISTURL_SUFFIX}
DISTFILES_8000= \
	iwlwifi-8000C-36.ucode${DISTURL_SUFFIX} \
	iwlwifi-8265-36.ucode${DISTURL_SUFFIX}
DISTFILES_9000= \
	iwlwifi-9000-pu-b0-jf-b0-46.ucode${DISTURL_SUFFIX} \
	iwlwifi-9260-th-b0-jf-b0-46.ucode${DISTURL_SUFFIX}
DISTFILES_22000= \
	iwlwifi-QuZ-a0-hr-b0-77.ucode${DISTURL_SUFFIX} \
	iwlwifi-QuZ-a0-jf-b0-77.ucode${DISTURL_SUFFIX} \
	iwlwifi-Qu-b0-hr-b0-77.ucode${DISTURL_SUFFIX} \
	iwlwifi-Qu-b0-jf-b0-77.ucode${DISTURL_SUFFIX} \
	iwlwifi-Qu-c0-hr-b0-77.ucode${DISTURL_SUFFIX} \
	iwlwifi-cc-a0-77.ucode${DISTURL_SUFFIX}
DISTFILES_ax210= \
	iwlwifi-ma-b0-gf4-a0.pnvm${DISTURL_SUFFIX} \
	iwlwifi-ma-b0-gf4-a0-89.ucode${DISTURL_SUFFIX} \
	iwlwifi-ma-b0-gf-a0.pnvm${DISTURL_SUFFIX} \
	iwlwifi-ma-b0-gf-a0-89.ucode${DISTURL_SUFFIX} \
	iwlwifi-ma-b0-hr-b0-89.ucode${DISTURL_SUFFIX} \
	iwlwifi-so-a0-gf4-a0.pnvm${DISTURL_SUFFIX} \
	iwlwifi-so-a0-gf-a0.pnvm${DISTURL_SUFFIX} \
	iwlwifi-so-a0-gf-a0-89.ucode${DISTURL_SUFFIX} \
	iwlwifi-so-a0-hr-b0-89.ucode${DISTURL_SUFFIX} \
	iwlwifi-so-a0-jf-b0-72.ucode${DISTURL_SUFFIX}
DISTFILES_bz= \
	iwlwifi-gl-c0-fm-c0.pnvm${DISTURL_SUFFIX} \
	iwlwifi-gl-c0-fm-c0-92.ucode${DISTURL_SUFFIX}

DISTFILES_${FWDRV}= \
	${DISTFILES_7000} \
	${DISTFILES_8000} \
	${DISTFILES_9000} \
	${DISTFILES_22000} \
	${DISTFILES_ax210} \
	${DISTFILES_bz}
DISTFILES_${FWDRV}_lic=
### <<<

DISTFILES_ax210+= \
	iwlwifi-ma-b0-hr-b0-83.ucode${DISTURL_SUFFIX}
DISTFILES_bz+= \
	iwlwifi-gl-c0-fm-c0-83.ucode${DISTURL_SUFFIX}

.include "${BASEDIR}/Makefile.inc"
