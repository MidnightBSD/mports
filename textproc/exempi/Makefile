# $MidnightBSD: mports/textproc/exempi/Makefile,v 1.2 2011/02/02 21:23:47 laffer1 Exp $

PORTNAME=	exempi
PORTVERSION=	2.1.1
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	http://libopenraw.freedesktop.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A port of Adobe XMP SDK to work on UNIX
LICENSE=	bsd3

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2

USE_AUTOTOOLS=	libtool
USE_GNOME=	ltverhack gnomehack
CONFIGURE_ARGS=	--enable-unittest=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="-liconv"
USE_ICONV=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$${libdir}/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
