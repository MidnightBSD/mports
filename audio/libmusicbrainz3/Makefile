# $MidnightBSD$

PORTNAME=	libmusicbrainz3
PORTVERSION=	3.0.3
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.musicbrainz.org/pub/musicbrainz/ \
		http://ftp.osuosl.org/pub/musicbrainz/
DISTNAME=	${PORTNAME:S/3//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MusicBrainz client library for audio metadata lookup

LICENSE=	lgpl2.1

LIB_DEPENDS=	libdiscid.so:${PORTSDIR}/audio/libdiscid \
		libneon.so:${PORTSDIR}/www/neon

USES=		cmake
USE_LDCONFIG=	yes

post-patch:
	${REINPLACE_CMD} -e '/pkgconfig/s|$${LIB_INSTALL_DIR}|libdata|' \
		-e '/CppUnit/d' ${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		 ${WRKSRC}/cmake/modules/*.cmake

.include <bsd.port.mk>
