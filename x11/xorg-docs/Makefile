PORTNAME=	xorg-docs
PORTVERSION=	1.7.1
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org documentation files

LICENSE=	mit

CONFIGURE_ARGS+=	--without-xmlto --without-fop --disable-specs
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share

USES=		xorg-cat:doc

.include <bsd.port.mk>
