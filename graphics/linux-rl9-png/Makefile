PORTNAME=	libpng
PORTVERSION=	1.6.37
DISTVERSIONSUFFIX=	-12.el9
PORTREVISION=	1
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating PNG images (Rocky Linux ${LINUX_DIST_VER})
WWW=		http://www.libpng.org/pub/png/libpng.html

LICENSE=	LIBPNG
LICENSE_NAME=	libpng license
LICENSE_FILE=	${WRKSRC}/usr/share/licenses/libpng//LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/png/pkg-descr

.include <bsd.port.mk>
