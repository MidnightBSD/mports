PORTNAME=	atk
PORTVERSION=	2.28.1
DISTVERSIONSUFFIX=	-2.el7
PORTREVISION=	1
CATEGORIES=	accessibility linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessibility Toolkit (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://developer.gnome.org/atk/

LICENSE=	gpl3

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
