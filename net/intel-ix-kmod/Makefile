PORTNAME=	ix
PORTVERSION=	3.3.35
PORTEPOCH=	0
MASTER_SITES?=	https://downloadmirror.intel.com/29625/eng/:man \
		https://downloadmirror.intel.com/682699/

DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${_MAN_SOURCE}${EXTRACT_SUFX}:man
_MAN_SOURCE=	${PORTNAME}-3.3.10

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	10 gigabit FreeBSD Base Driver for Intel(R) Network Connections

MAX_NETMAP_OSVERSION=   300000

MANPAGENAME=	ixgbe
MANPAGELINKS=	ix if_ix if_ixgbe

MASTERDIR=	${.CURDIR}/../intel-ixl-kmod
PATCHDIR=	${.CURDIR}/files
PKGDIR=		${.CURDIR}
DISTINFO_FILE=	${.CURDIR}/distinfo

OPTIONS_DEFINE=	SRIOV
SRIOV_DESC=	Enable SR-IOV support (experimental)

post-patch-SRIOV-on:
	@${SED} -i '' 's|SRIOV_ENABLE = 0|SRIOV_ENABLE = 1|g' ${WRKSRC}/Makefile

pre-install:
	${CP} ${WRKDIR}/${_MAN_SOURCE}/src/${MANPAGENAME}.4 ${WRKSRC}

.include "${MASTERDIR}/Makefile"
