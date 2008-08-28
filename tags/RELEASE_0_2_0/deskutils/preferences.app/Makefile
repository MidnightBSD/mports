# New ports collection makefile for:   preferences.app
# Date created:         04 Feb 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/deskutils/preferences.app/Makefile,v 1.10 2006/03/19 04:35:43 dinoex Exp $
# $MidnightBSD: mports/deskutils/preferences.app/Makefile,v 1.4 2007/11/07 20:20:11 ctriv Exp $
#

PORTNAME=	preferences.app
PORTVERSION=	1.2.0
PORTREVISION=	5
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	prefsapp
DISTNAME=	Preferences-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep workspace manager
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
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
