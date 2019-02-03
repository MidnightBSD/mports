# $MidnightBSD$

PORTNAME=	libdiscid
PORTVERSION=	0.6.1
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.musicbrainz.org/pub/musicbrainz/${PORTNAME}/ \
		http://ftp.osuosl.org/pub/musicbrainz/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for creating MusicBrainz DiscIDs

LICENSE=	lgpl2.1

USES=		cmake
USE_LDCONFIG=	yes

post-patch:
	${REINPLACE_CMD} -e '/pkgconfig/s|$${LIB_INSTALL_DIR}|libdata|' \
		 ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
