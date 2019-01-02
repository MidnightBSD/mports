# $MidnightBSD$

PORTNAME=	xorgproto
PORTVERSION=	2018.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	xorg protocol headers

LICENSE=	mit

XORG_CAT=	proto

CONFIGURE_ARGS= --without-fop \
		--without-xmlto \
		--without-xsltproc \
		--enable-legacy

pre-patch:
	@${MKDIR} ${WRKSRC}/man

.include <bsd.port.mk>
