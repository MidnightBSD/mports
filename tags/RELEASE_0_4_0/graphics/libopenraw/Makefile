# $MidnightBSD: mports/graphics/libopenraw/Makefile,v 1.2 2010/03/25 01:28:08 laffer1 Exp $

PORTNAME=	libopenraw
PORTVERSION=	0.0.8
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://libopenraw.freedesktop.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for camera RAW files decoding
LICENSE=	gpl3

# we only need boost libs, but since most ports use
# boost-python, go with that for now
LIB_DEPENDS=	boost_thread:${PORTSDIR}/devel/boost-libs \
		jpeg.11:${PORTSDIR}/graphics/jpeg

MAKE_JOBS_SAFE=	yes
USE_GNOME=	libxml2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-boost=${LOCALBASE}/include

OPTIONS=	GNOME "GNOME support (needs gtk20)" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_GNOME)
USE_GNOME=	gtk20
PLIST_SUB+=	GNOME=""
.else
CONFIGURE_ARGS+=--disable-gnome
PLIST_SUB+=	GNOME="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|testsuite ||' ${WRKSRC}/Makefile.in

.include <bsd.port.post.mk>
