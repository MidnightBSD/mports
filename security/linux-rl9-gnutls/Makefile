PORTNAME=	gnutls
PORTVERSION=	3.8.3
DISTVERSIONSUFFIX=	-4.el9_4
PORTREVISION=	1
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Transport Layer Security library (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://gnutls.org/

LICENSE=        gpl3 lgpl2.1
LICENSE_COMB=   multi

USES=		cpe linux:rl9
CPE_VENDOR=	gnu
USE_LDCONFIG=	yes
USE_LINUX=	libidn2 libtasn1 nettle p11-kit
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
