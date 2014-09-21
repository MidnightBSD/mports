# $MidnightBSD$
# $FreeBSD: ports/audio/gnustep-cdplayer/Makefile,v 1.3 2007/01/31 18:17:49 dinoex Exp $

PORTNAME=	cdplayer
PORTVERSION=	0.5.1
PORTREVISION=	2
CATEGORIES=	audio gnustep
MASTER_SITES=	SF/gsburn/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMEPREFIX=	gnustep-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep CD player with CDDB support

LIB_DEPENDS+=	libcdaudio.so:${PORTSDIR}/audio/libcdaudio

LICENSE=	gpl2

USES=		tar:bzip2
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_BUNDLES+=	Cddb:${CDDB_BUNDLE_PORT}
USE_GNUSTEP_SYSTEM_LIBS+=	PrefsModule:${PREFERENCES_PORT}

WRKSRC=		${WRKDIR}/CDPlayer-${PORTVERSION}
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}

CDDB_BUNDLE_PORT?=	audio/cddb-bundle
PREFERENCES_PORT?=	deskutils/preferences.app

.include <bsd.port.mk>
