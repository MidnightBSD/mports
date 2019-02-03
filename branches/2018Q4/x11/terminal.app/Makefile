# $MidnightBSD$

PORTNAME=	terminal.app
PORTVERSION=	0.9.9
CATEGORIES=	x11 gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	Terminal-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal Emulator for GNUstep

LICENSE=	gpl2 # only
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep iconv
USE_GNUSTEP=	back build

MAKE_ARGS+=Terminal_TOOL_LIBS='${ICONV_LIB} -lutil'

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Terminal.app/Terminal

.include <bsd.port.mk>
