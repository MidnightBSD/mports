# $MidnightBSD$
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

USES=           gnustep
USE_GNUSTEP=    back build

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Services/User/DictionaryReader

.include <bsd.port.mk>
