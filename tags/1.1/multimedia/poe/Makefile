# $MidnightBSD$

PORTNAME=	poe
PORTVERSION=	0.5.1
PORTREVISION=	3
CATEGORIES=	multimedia gnustep
MASTER_SITES=	http://www.eskimo.com/~pburns/Poe/files/
DISTNAME=	Poe-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vorbis comment editor for GNUstep

LICENSE=	gpl2 # or later

LIB_DEPENDS=	libvorbis.so:${PORTSDIR}/audio/libvorbis

USES=		gnustep
USE_GNUSTEP=	back build

PORTSCOUT=	skipv:0.5.2

post-patch:
	${REINPLACE_CMD} -e 's|-lvorbisfile$$|-lvorbisfile -logg|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Poe.app/Poe

.include <bsd.port.mk>
