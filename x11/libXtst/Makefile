# $MidnightBSD$

PORTNAME=	libXtst
PORTVERSION=	1.2.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Test extension

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	x11 xext recordproto:both xextproto inputproto:both \
		xi
USES+=	cpe
CPE_PRODUCT=	libxtst
CPE_VENDOR=	x

CONFIGURE_ARGS+=--disable-specs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/specs//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
