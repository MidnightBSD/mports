# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	dbus-glib
PORTVERSION=	0.100
DISTVERSIONSUFFIX=	-7.el7
PORTREVISION=	1
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib bindings for D-Bus (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	dbuslibs expat
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
