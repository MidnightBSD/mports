# $MidnightBSD$ 

PORTNAME=	textedit.app
PORTVERSION=	4.0
PORTREVISION=	2
CATEGORIES=	editors gnustep
MASTER_SITES=	http://git.savannah.gnu.org/cgit/backbone.git/snapshot/
DISTNAME=	backbone-6343263e17c5cd771770dabc2559ac07ffedcf29

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic text editor for GNUstep
LICENSE=	other

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build gui

WRKSRC=		${WRKDIR}/${DISTNAME}/${USE_GNUSTEP_MAKE_DIRS}
USE_GNUSTEP_MAKE_DIRS=	System/Applications/TextEdit
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

.include <bsd.port.mk>
