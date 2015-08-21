# $MidnightBSD$

PORTNAME=	libunicode
PORTVERSION=	0.4
PORTREVISION=	3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME/sources/libunicode/0.4
DISTNAME=	${PORTNAME}-${PORTVERSION}.gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating Unicode characters and strings

LICENSE=	gpl2

USES=		gmake libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--localstatedir=${PREFIX}/share \
		--datadir=${PREFIX}/share
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.mk>
