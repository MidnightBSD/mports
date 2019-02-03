# $MidnightBSD$

PORTNAME=	xextproto
PORTVERSION=	7.3.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XExt extension headers

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING
	
XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs

post-patch:
	@${REINPLACE_CMD} '/^SUBDIR/s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
