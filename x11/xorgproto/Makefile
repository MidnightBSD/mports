PORTNAME=	xorgproto
DISTVERSION=	2023.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Window System unified protocol definitions
WWW=		https://gitlab.freedesktop.org/xorg/proto/xorgproto

LICENSE=	mit

USES=		tar:xz xorg-cat:proto

CONFIGURE_ARGS= --without-fop \
		--without-xmlto \
		--without-xsltproc \
		--disable-specs

OPTIONS_DEFINE=	DOCS

pre-patch:
	@${MKDIR} ${WRKSRC}/man

.include <bsd.port.mk>
