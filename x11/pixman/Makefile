# $MidnightBSD$

PORTNAME=	pixman
PORTVERSION=	0.32.8
PORTREVISION=	0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe perl5
XORG_CAT=	lib
USE_PERL5_BUILD=yes
CONFIGURE_ARGS=	--disable-gtk
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
