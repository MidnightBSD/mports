# $MidnightBSD$

PORTNAME=	jpeg
PORTVERSION=	1.2.1
CATEGORIES=	graphics linux
DISTNAME=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SIMD-accelerated JPEG codec (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	other

DOCSDIR=	${PREFIX}/usr/share/doc/${LINUXNAME}-${PORTVERSION}
LINUXNAME=	libjpeg-turbo
RPMVERSION=	3.el6_5
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
