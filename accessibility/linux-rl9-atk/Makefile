PORTNAME=	atk
PORTVERSION=	2.36.0
DISTVERSIONSUFFIX=	-5.el9
PORTREVISION=	1
CATEGORIES=	accessibility linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessibility Toolkit (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://developer.gnome.org/atk/

LICENSE=	gpl3

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
