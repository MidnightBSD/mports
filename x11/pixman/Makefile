# $MidnightBSD$

PORTNAME=	pixman
PORTVERSION=	0.32.6
PORTREVISION=	2
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
