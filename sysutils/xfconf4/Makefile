#
# $MidnightBSD: mports/sysutils/xfconf4/Makefile,v 1.2 2009/03/12 03:21:46 ctriv Exp $
# $FreeBSD: ports/sysutils/xfce4-utils/Makefile,v 1.42 2008/06/06 14:03:25 edwin Exp $
#

PORTNAME=	xfconf4
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	sysutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfconf-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 Configuration System
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_XFCE=	configenv libutil
USE_GNOME=	pkgconfig gnomehack gnometarget
USE_LDCONFIG=	yes

.include <bsd.port.mk>

