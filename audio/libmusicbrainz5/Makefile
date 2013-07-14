# $MidnighitBSD$

PORTNAME=	libmusicbrainz
PORTVERSION=	5.0.1
CATEGORIES=	audio
MASTER_SITES=	https://cloud.github.com/downloads/metabrainz/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MusicBrainz client library for audio metadata lookup

LICENSE=	lgpl2.1

LIB_DEPENDS=	neon:${PORTSDIR}/www/neon29

LATEST_LINK=	${PORTNAME}5

USES=		cmake
USE_LDCONFIG=	yes

MAKE_JOBS_SAFE=	yes

post-patch:
	${REINPLACE_CMD} -e '/pkgconfig/s|$${LIB_INSTALL_DIR}|libdata|' \
		 ${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		 ${WRKSRC}/cmake/modules/*.cmake

.include <bsd.port.mk>
