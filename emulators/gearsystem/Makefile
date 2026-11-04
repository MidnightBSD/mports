PORTNAME=	Gearsystem
PORTVERSION=	3.4.1
CATEGORIES=	emulators
MASTER_SITES=	https://github.com/drhelius/Gearsystem/archive/refs/tags/
DISTFILES=	gearsystem-3.4.1.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	SMS / GG emulator

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

WRKSRC=		${WRKDIR}/Gearsystem-gearsystem-3.4.1

USES=		gl gmake libtool localbase pathfix pkgconfig

#USE_GITHUB=	yes
#GH_ACCOUNT=	drhelius
USE_LDCONFIG=	yes
USE_SDL=	sdl2
USE_GL=		glew

USE_GCC=	yes

do-build:
	cd ${WRKSRC}/platforms/bsd; env ${MAKE_ENV} ${MAKE_CMD} ${FAKE_MAKEARGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/platforms/bsd/gearsystem ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/platforms/bsd/gamecontrollerdb.txt ${PREFIX}/bin

.include <bsd.port.mk>
