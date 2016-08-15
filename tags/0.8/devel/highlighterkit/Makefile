# $MidnightBSD$

PORTNAME=	highlighterkit
PORTVERSION=	0.1
PORTREVISION=	4
CATEGORIES=	devel gnustep
MASTER_SITES=	http://download.gna.org/pmanager/0.2/
DISTNAME=	HighlighterKit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework needed by Project Manager

LICENSE=	gpl2

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/GNUstep/Local/Library/Frameworks/HighlighterKit.framework/Versions/0/libHighlighterKit.so

.include <bsd.port.mk>
