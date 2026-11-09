PORTNAME=	mtkbt-firmware
DISTVERSION=	20261019
CATEGORIES=	comms
MASTER_SITES=	https://gitlab.com/kernel-firmware/linux-firmware/-/raw/${DISTVERSION}/ \
		https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/
DISTFILES=	${MTKBT_FILES:S/$/${DISTURL_SUFFIX}/} \
		${MTKBT_LICENSE}${DISTURL_SUFFIX}
DIST_SUBDIR=	linux-firmware/mtkbtfw
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MediaTek MT79xx USB bluetooth adaptor firmwares used by mtkbtfw(8)
WWW=		https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek

LICENSE=	MEDIATEK
LICENSE_NAME=	MediaTek firmware license
LICENSE_FILE=	${WRKSRC}/LICENCE.mediatek
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

NO_WRKSUBDIR=	yes
NO_BUILD=	yes
NO_ARCH=	yes

DISTURL_SUFFIX=	?h=${DISTVERSION}

# Installed below ${DATADIR} with the leading mediatek/ stripped, which is
# the layout mtkbtfw(8) expects.
MTKBT_FILES=	mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin \
		mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin \
		mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin \
		mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin \
		mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
MTKBT_LICENSE=	LICENSES/LICENCE.mediatek

do-extract:
	@${MKDIR} ${WRKSRC}/fw
	${CP} ${DISTDIR}/${DIST_SUBDIR}/${MTKBT_LICENSE}${DISTURL_SUFFIX} \
	    ${WRKSRC}/LICENCE.mediatek
.for _f in ${MTKBT_FILES}
	@${MKDIR} ${WRKSRC}/fw/${_f:H:S,^mediatek,,:S,^/,,}
	${CP} ${DISTDIR}/${DIST_SUBDIR}/${_f}${DISTURL_SUFFIX} \
	    ${WRKSRC}/fw/${_f:S,^mediatek/,,}
.endfor

do-install:
	cd ${WRKSRC}/fw && ${COPYTREE_SHARE} . ${DATADIR}

.include <bsd.port.mk>
