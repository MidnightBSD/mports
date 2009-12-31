# $MidnightBSD: mports/deskutils/xpad/Makefile,v 1.3 2008/07/19 09:04:45 crash Exp $

PORTNAME=	xpad
PORTVERSION=	3.1
CATEGORIES=	deskutils
MASTER_SITES=	http://launchpad.net/xpad/stable/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A virtual note-pad system for your X11 desktop
LICENSE=        gpl2

FETCH_ARGS=	"-pRr"
USE_BZIP2=	yes
USE_GNOME=	pkgconfig gtk20 gnomehier intltool
USE_GMAKE=	yes
USE_XORG=	x11 sm
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CXXFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		xpad.1

.include <bsd.port.mk>
