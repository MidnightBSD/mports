# $MidnightBSD$

PORTNAME=	gozer
PORTVERSION=	0.7
PORTREVISION=   3
CATEGORIES=	graphics
MASTER_SITES=	http://linuxbrit.co.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Commandline text rendering utility - creates images from text
LICENSE=	mit

LIB_DEPENDS=	libgiblib.so.1:${PORTSDIR}/graphics/giblib

USE_XORG=	x11
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-giblib-prefix=${LOCALBASE}
CFLAGS+=	-I${LOCALBASE}/include

.if defined(NOPORTDOCS)
MAKE_ENV=	NO_DOC=yes
.endif

.include <bsd.port.mk>
