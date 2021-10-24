# Created by: Andrew Thompson <thompsa@FreeBSD.org>

PORTNAME=	bwi-firmware
PORTVERSION=	${FWVERSION}
CATEGORIES=	net
MASTER_SITES=	http://downloads.openwrt.org/sources/ \
		http://mirror2.openwrt.org/sources/
PKGNAMESUFFIX=	-kmod
DISTFILES=	${FWFILE}
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Broadcom AirForce IEEE 802.11 Firmware Kernel Module

LICENSE=	other

NO_CDROM=       Modified firmware, cannot be distributed
RESTRICTED=     Redistribution of repackaged binaries not permitted

ONLY_FOR_ARCHS=		amd64 i386 powerpc
ONLY_FOR_ARCHS_REASON=	hardware particular to PCI/CardBus

BUILD_DEPENDS=	b43-fwcutter:sysutils/b43-fwcutter

FIRMWARES=	ucode ucode11 ucode2 ucode4 ucode5 \
		a0g0bsinitvals2 a0g0bsinitvals5 a0g0initvals2 \
		a0g0initvals5 a0g1bsinitvals5 a0g1initvals5 \
		b0g0bsinitvals2 b0g0bsinitvals5 b0g0initvals2 b0g0initvals5 \
		pcm4 pcm5

NO_WRKSUBDIR=	yes
FWNAME=		bwi_v3
FWFILE=		wl_apsta-${FWVERSION}.0.o
FWVERSION=	3.130.20
KMODNAME=	${FWNAME}_ucode
PLIST_SUB=	KMODNAME="${KMODNAME}"

USES=		kmod uidfix

do-build:
	cd ${WRKSRC} &&  \
	b43-fwcutter -w ${WRKSRC} ${DISTDIR}/${FWFILE}
	${TOUCH} ${WRKSRC}/v3/ucode.fw

	@${ECHO_CMD} "KMOD= ${KMODNAME}" > ${WRKSRC}/v3/Makefile
	@${ECHO_CMD} "FIRMWS= ${FIRMWARES:C/.*/&.fw:${FWNAME}_&/}" >> \
		${WRKSRC}/v3/Makefile
	@${ECHO_CMD} ".include <bsd.kmod.mk>" >> ${WRKSRC}/v3/Makefile
	@cd ${WRKSRC}/v3; make all

do-install:
	${MKDIR} ${KMODDIR}
	@cd ${WRKSRC}/v3; ${SETENV} ${MAKE_ENV} KMODDIR="${FAKE_DESTDIR}${KMODDIR}" make install

.include <bsd.port.mk>
