PORTNAME=	libproxy
PORTVERSION=	0.4.15
DISTVERSIONSUFFIX=	-35.el9
PORTREVISION=	1
CATEGORIES=	net linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library that provides automatic proxy configuration management. (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://libproxy.github.io/libproxy/

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
