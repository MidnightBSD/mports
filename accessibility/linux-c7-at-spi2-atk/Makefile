PORTNAME=	at-spi2-atk
PORTVERSION=	2.26.2
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	accessibility linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assistive technology ATK bridge (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://gitlab.gnome.org/GNOME/at-spi2-atk

LICENSE=	lgpl

USES=		cpe linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	at-spi2-core atk dbuslibs
USE_LINUX_RPM=	yes
CPE_VENDOR=	gnome

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
