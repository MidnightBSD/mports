PORTNAME=	cdplayer
PORTVERSION=	0.5.1
PORTREVISION=	5
CATEGORIES=	audio gnustep
MASTER_SITES=	SF/gsburn/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMEPREFIX=	gnustep-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep CD player with CDDB support

LICENSE=	gpl2 # or later
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcdaudio.so:${PORTSDIR}/audio/libcdaudio \
		libPrefsModule.so:${PORTSDIR}/deskutils/preferences

BUILD_DEPENDS=	cddb-bundle>0:${PORTSDIR}/audio/cddb-bundle
RUN_DEPENDS=	cddb-bundle>0:${PORTSDIR}/audio/cddb-bundle

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/CDPlayer-${PORTVERSION}

post-install:
	${STRIP_CMD} \
		${PREFIX}/GNUstep/System/Library/Bundles/AudioCD.bundle/AudioCD \
		${PREFIX}/GNUstep/System/Library/Bundles/AudioCD.prefs/AudioCD \
		${PREFIX}/GNUstep/System/Applications/CDPlayer.app/CDPlayer

.include <bsd.port.mk>
