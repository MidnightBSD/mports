# New ports collection makefile for:   preferences.app
# Date created:         04 Feb 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/deskutils/preferences.app/Makefile,v 1.10 2006/03/19 04:35:43 dinoex Exp $
# $MidnightBSD: mports/deskutils/preferences.app/Makefile,v 1.6 2009/12/31 23:41:22 laffer1 Exp $
#

PORTNAME=	preferences.app
PORTVERSION=	1.2.0
PORTREVISION=	6
CATEGORIES=	deskutils gnustep
MASTER_SITES=	SF/prefsapp/prefsapp/${PORTVERSION}
DISTNAME=	Preferences-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep workspace manager
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG= ${GNUSTEP_SYSTEM_LIBRARIES}
MAKEFILE=	GNUmakefile

MODIFY=		GNUmakefile.preamble PrefsModule/GNUmakefile.preamble \
		Modules/Keyboard/GNUmakefile.preamble \
		Modules/PrefsApp/GNUmakefile.preamble

post-patch:
.for i in ${MODIFY}
	@${MV} ${WRKSRC}/${i} ${WRKSRC}/${i}.sed
	@${SED} -e "s= -Werror==" ${WRKSRC}/${i}.sed > ${WRKSRC}/${i}
	@${REINPLACE_CMD} -e 's/GNUSTEP_INSTALLATION_DIR=.*/GNUSTEP_INSTALLATION_DOMAIN=SYSTEM/' ${WRKSRC}/${i}
.endfor

.include <bsd.port.mk>
