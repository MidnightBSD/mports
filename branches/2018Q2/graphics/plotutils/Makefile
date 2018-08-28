# $MidnightBSD$

PORTNAME=	plotutils
PORTVERSION=	2.6
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A plotting library and toolkit

LICENSE=	gpl3

LIB_DEPENDS=	libpng.so:${PORTSDIR}/graphics/png

USES=		gmake libtool
GNU_CONFIGURE=	yes
USE_MOTIF=	yes
CONFIGURE_ARGS=	--enable-libplotter --enable-libxmi --with-motif
USE_LDCONFIG=	yes

INFO=		libxmi plotutils

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
