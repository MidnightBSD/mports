# $MidnightBSD$

PORTNAME=	recordproto
PORTVERSION=	1.14.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RECORD extension headers

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

XORG_CAT=	proto

CONFIGURE_ARGS+=--disable-specs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/&$$/ \
		s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
