# $MidnightBSD$

PORTNAME=	compiler
PORTVERSION=	0.4.1
CATEGORIES=	lang gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project Smalltalk Compiler

LICENSE=	bsd2

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNUSTEP_LOCAL_LIBS+=	EtoileFoundation:${FOUNDATION_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	LanguageKit:${LANGUAGEKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	SmalltalkSupport:${SMALLTALKKIT_PORT}

DEFAULT_LIBVERSION=	0.1
WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Languages/Compiler
PLIST_FILES=	Local/Tools/edlc

FOUNDATION_PORT?=	devel/etoile-foundation
LANGUAGEKIT_PORT?=	lang/etoile-languagekit
SMALLTALKKIT_PORT?=	lang/etoile-smalltalkkit

.include <bsd.port.mk>
