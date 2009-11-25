# $MidnightBSD: mports/multimedia/libtheora/Makefile,v 1.6 2009/09/20 01:47:24 laffer1 Exp $

PORTNAME=	libtheora
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://downloads.xiph.org/releases/theora/ \
		http://distfiles.master.finkmirrors.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Theora video codec for the Ogg multimedia streaming system
LICENSE=	bsd3

LIB_DEPENDS=	vorbis.4:${PORTSDIR}/audio/libvorbis

USE_BZIP2=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool:22
USE_GNOME=	ltverhack
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include " \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="${PTHEAD_LIBS}"
CONFIGURE_ARGS+=--disable-sdltest \
		--enable-shared \
		--disable-examples
MAKE_JOBS_SAFE=yes

post-patch:
	@${REINPLACE_CMD} -e 's|doc||g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's,  x86_64),  x86_64|amd64),' ${WRKSRC}/configure

.include <bsd.port.mk>
