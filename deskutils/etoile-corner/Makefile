# $MidnightBSD$

PORTNAME=	corner
PORTVERSION=	0.4.1
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project hot-corners

LICENSE=	bsd3

USES=           gnustep tar:bzip2
USE_GNUSTEP=    back build

USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	SmalltalkSupport:${SMALLTALKKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	ScriptKit:${SCRIPTKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	LanguageKit:${LANGUAGEKIT_PORT}
USE_XORG=	x11

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/Corner
PLIST_FILES=	GNUstep/System/Tools/Corner

SMALLTALKKIT_PORT?=	lang/etoile-smalltalkkit
SCRIPTKIT_PORT?=	lang/etoile-scriptkit
LANGUAGEKIT_PORT?=	lang/etoile-languagekit

.include <bsd.port.mk>
