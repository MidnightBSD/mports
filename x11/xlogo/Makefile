PORTNAME=	xlogo
PORTVERSION=	1.0.6
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Displays the X Window System logo

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz xorg xorg-cat:app
USE_XORG=	sm x11 xaw xext xft xmu xrender xt

OPTIONS_DEFINE=	XKB
OPTIONS_DEFAULT=XKB

XKB_DESC=		Use XKB to sound bells
XKB_USE=		XORG=xkbfile
XKB_CONFIGURE_WITH=	xkb

GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share

.include <bsd.port.mk>
