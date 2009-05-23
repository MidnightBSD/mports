# $MidnightBSD: mports/x11-toolkits/gtkglext/Makefile,v 1.2 2008/08/20 18:29:42 laffer1 Exp $

PORTNAME=	gtkglext
PORTVERSION=	1.2.0
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An OpenGL extension to GTK
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix gnometarget gtk20
USE_XORG=	xt
USE_GL=		yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes

.include <bsd.port.mk>
