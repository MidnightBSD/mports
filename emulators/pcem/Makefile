PORTNAME=	pcem
DISTVERSIONPREFIX=	v
DISTVERSION=	17
PORTREVISION=	1
CATEGORIES=	emulators

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PC/PC-Compatible low-level emulator striving for accuracy
WWW=		https://www.pcem-emulator.co.uk

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	amd64

USES=		autoreconf compiler dos2unix gl gmake localbase:ldflags openal \
		pkgconfig sdl
USE_GITHUB=	yes
GH_ACCOUNT=	sarah-walker-pcem
USE_GL=		gl
USE_SDL=	sdl2
USE_WX=		3.0

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-release-build \
		--with-wx-config="${WX_CONFIG}"

PLIST_FILES=	bin/pcem

.include <bsd.port.mk>
