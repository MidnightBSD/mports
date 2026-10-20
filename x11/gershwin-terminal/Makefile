PORTNAME=	gershwin-terminal
DISTVERSION=	20260129
CATEGORIES=	x11 gnustep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gershwin Terminal Emulator for GNUstep
WWW=		https://github.com/gershwin-desktop/gershwin-terminal

LICENSE=	gpl2 # only

USES=		gershwin iconv
CONFLICTS=	terminal.app
USE_GERSHWIN=	back build

USE_GITHUB=	yes
GH_ACCOUNT=	gershwin-desktop
GH_TAGNAME=	71124e3

MAKE_ARGS+=	Terminal_TOOL_LIBS='${ICONV_LIB} -lutil'

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}/System/Applications/Terminal.app/Resources/Preferences.bundle/Preferences

.include <bsd.port.mk>
