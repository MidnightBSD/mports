PORTNAME=	libsoup
PORTVERSION=	2.72.0
DISTVERSIONSUFFIX=	-8.el9_5.2
PORTREVISION=	2
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SOAP (Simple Object Access Protocol) implementation in C (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://libsoup.org/

LICENSE=	lgpl

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	libgcrypt libpsl
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
