# $MidnightBSD: mports/x11-toolkits/gtkglext/Makefile,v 1.7 2010/11/20 03:50:08 laffer1 Exp $

PORTNAME=	gtkglext
PORTVERSION=	1.2.0
PORTREVISION=	2
CATEGORIES=	x11-toolkits
MASTER_SITES=	SF
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An OpenGL extension to GTK
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix gnometarget gtk20
USE_XORG=	x11 xt
USE_GL=		yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-DGTK_DISABLE_DEPRECATED||g' \
		-e 's|-DGDK_DISABLE_DEPRECATED||g' \
		${WRKSRC}/examples/Makefile.in ${WRKSRC}/gtk/Makefile.in 

.include <bsd.port.mk>
