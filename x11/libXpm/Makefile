PORTNAME=	libXpm
PORTVERSION=	3.5.13
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Pixmap library

LICENSE=	mit

USES=		xorg xorg-cat:lib
USE_XORG=	xorgproto x11 xext xt
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=		NLS
NLS_USES=		gettext
NLS_CONFIGURE_ENV_OFF=	ac_cv_search_gettext=no

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
