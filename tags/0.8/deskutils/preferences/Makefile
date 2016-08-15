# New ports collection makefile for:   preferences.app
# Date created:         04 Feb 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/deskutils/preferences.app/Makefile,v 1.10 2006/03/19 04:35:43 dinoex Exp $
# $MidnightBSD$
#

PORTNAME=	preferences
PORTVERSION=	1.2.0
PORTREVISION=	8
CATEGORIES=	deskutils gnustep
MASTER_SITES=	SF/prefsapp/prefsapp/${PORTVERSION}
DISTNAME=	Preferences-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep workspace manager

LICENSE_COMB=	multi
LICENSE=	gpl2 lgpl2.1

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

DEAFULT_LIBVERSION=	1.1.1
MODIFY=		GNUmakefile.preamble PrefsModule/GNUmakefile.preamble \
		Modules/Keyboard/GNUmakefile.preamble \
		Modules/PrefsApp/GNUmakefile.preamble

post-patch:
	${REINPLACE_CMD} 's, -Werror,,' ${MODIFY:S,^,${WRKSRC}/,}
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile.preamble

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Preferences.app/Preferences
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Preferences.app/Resources/PrefsApp.prefs/PrefsApp
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Library/Frameworks/PrefsModule.framework/Versions/0/libPrefsModule.so
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Library/Preferences/Keyboard.prefs/Keyboard

.include <bsd.port.mk>
