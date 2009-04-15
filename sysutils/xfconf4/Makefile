#
# $MidnightBSD: mports/sysutils/xfconf4/Makefile,v 1.3 2009/03/13 03:40:20 ctriv Exp $
# $FreeBSD: ports/sysutils/xfce4-utils/Makefile,v 1.42 2008/06/06 14:03:25 edwin Exp $
#

PORTNAME=	xfconf4
PORTVERSION=	${XFCE_VERSION}
PORTREVISION=	1
CATEGORIES=	sysutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfconf-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 Configuration System
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_XFCE=	configenv libutil
USE_GNOME=	pkgconfig gnomehack gnometarget
USE_LDCONFIG=	yes

.include <bsd.port.mk>

