PORTNAME=	ice
PORTVERSION=	1.38.16
PORTEPOCH=	0
MASTER_SITES?=	https://downloadmirror.intel.com/786082/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Intel® Network Adapter Driver for E810 Series Devices

MANPAGENAME=	ice
MANPAGELINKS=	if_ice

MASTERDIR=	${.CURDIR}/../intel-ixl-kmod
PATCHDIR=	${.CURDIR}/files
PKGDIR=		${.CURDIR}
DISTINFO_FILE=	${.CURDIR}/distinfo
WRKSRC_SUBDIR=

OPTIONS_DEFINE=	SRIOV
SRIOV_DESC=	Enable SR-IOV support (experimental)
SRIOV_MAKE_ENV=	SRIOV_ENABLE=1
SRIOV_MAKE_ENV_OFF=	SRIOV_ENABLE=0

.include "${MASTERDIR}/Makefile"
