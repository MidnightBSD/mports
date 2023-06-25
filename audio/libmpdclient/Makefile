PORTNAME=	libmpdclient
PORTVERSION=	2.20
CATEGORIES=	audio
MASTER_SITES=	https://www.musicpd.org/download/libmpdclient/2/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	API library for interfacing MPD
WWW=		https://www.musicpd.org/libs/libmpdclient/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		meson tar:xz

MESON_ARGS=	--default-library=both
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS DOXYGEN
OPTIONS_SUB=	yes
DOXYGEN_IMPLIES=DOCS

DOXYGEN_BUILD_DEPENDS=	doxygen:devel/doxygen
DOXYGEN_MESON_TRUE=	documentation

.include <bsd.port.mk>
