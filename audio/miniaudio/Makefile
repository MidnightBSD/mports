PORTNAME=	miniaudio
DISTVERSION=	0.11.24 # upstream sometimes doesn't tag the repository
PORTEPOCH=	1
CATEGORIES=	audio devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C single header audio playback and capture library
WWW=		https://miniaud.io/ \
		https://github.com/mackron/miniaudio

LICENSE=	publicdom mit
LICENSE_COMB=	dual

USES=		cpe

CPE_VENDOR=	miniaudio_project

USE_GITHUB=	yes
GH_ACCOUNT=	mackron

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	include/miniaudio/miniaudio.h \
		include/miniaudio/extras/stb_vorbis.c

do-install:
	${MKDIR} ${PREFIX}/include/${PORTNAME}/extras
	${INSTALL_DATA} ${WRKSRC}/miniaudio.h ${PREFIX}/include/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/extras/stb_vorbis.c ${PREFIX}/include/${PORTNAME}/extras/stb_vorbis.c

.include <bsd.port.mk>
