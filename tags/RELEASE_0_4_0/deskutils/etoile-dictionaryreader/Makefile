# New ports collection makefile for:    etoile-dictionaryreader
# Date created:         4 Sep 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD: mports/deskutils/etoile-dictionaryreader/Makefile,v 1.4 2007/11/07 20:20:10 ctriv Exp $
# $FreeBSD: ports/deskutils/etoile-dictionaryreader/Makefile,v 1.6 2007/01/31 18:17:52 dinoex Exp $
#

PORTNAME=	dictionaryreader
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        unknown
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dict client for GNUstep
LICENSE=	mit

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Services/User/DictionaryReader

.include <bsd.port.mk>
