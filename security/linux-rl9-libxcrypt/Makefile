PORTNAME=	libxcrypt
PORTVERSION=	4.4.18
DISTVERSIONSUFFIX=	-3.el9
PORTREVISION=	1
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extended crypt library for descrypt, md5crypt, bcrypt, and others (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://github.com/besser82/libxcrypt

LICENSE=	lgpl2.1+

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
