PORTNAME=	irdma
PORTVERSION=	1.2.17
CATEGORIES=	net
MASTER_SITES?=	https://downloadmirror.intel.com/786091/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDMA FreeBSD* driver for Intel® Ethernet Controller E810
WWW=		https://www.intel.com/content/www/us/en/download/19762/irdma-rdma-freebsd-driver-for-intel-ethernet-controller-e810.html

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/doc/irdma_readme.txt

NOT_FOR_ARCHS=	armv6 armv7 i386
OT_FOR_ARCHS_REASON=	Not supported on 32-bits

BUILD_DEPENDS=	${NONEXISTENT}:net/intel-ice-kmod:extract
RUN_DEPENDS=	${KMODDIR}/if_ice_updated.ko:net/intel-ice-kmod

USES=		kmod

MAKE_CMD=	./build.sh
MAKE_ENV=	WERROR=""
MAKE_FLAGS=	`make -C ${PORTSDIR}/net/intel-ice-kmod -V WRKSRC`
MAKEFILE=
PLIST_FILES=	${KMODDIR}/${PORTNAME}_updated.ko \
		share/man/man4/irdma.4.gz
SUB_FILES=	pkg-message
SUB_LIST=	PORTNAME=${PORTNAME}

do-install:
	${INSTALL_KLD} ${WRKSRC}/src/${PORTNAME}.ko ${STAGEDIR}${KMODDIR}/${PORTNAME}_updated.ko
	${INSTALL_MAN} ${WRKSRC}/doc/${PORTNAME}.4.gz ${STAGEDIR}${PREFIX}/share/man/man4/

.include <bsd.port.mk>
