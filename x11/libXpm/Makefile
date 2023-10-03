PORTNAME=	libXpm
PORTVERSION=	3.5.17
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Pixmap library
WWW=		https://www.freedesktop.org/Software/xlibs

LICENSE=	mit

USES=		cpe tar:xz xorg xorg-cat:lib
USE_XORG=	xorgproto x11 xext xt
LDFLAGS+=	-L${LOCALBASE}/lib

CPE_VENDOR=	libxpm_project

OPTIONS_DEFINE=		NLS
NLS_USES=		gettext
NLS_CONFIGURE_ENV_OFF=	ac_cv_search_gettext=no

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
