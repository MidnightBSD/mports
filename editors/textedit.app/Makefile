# $MidnightBSD: mports/editors/textedit.app/Makefile,v 1.3 2008/10/21 14:38:28 laffer1 Exp $ 

PORTNAME=	textedit.app
PORTVERSION=	4.0
PORTREVISION=	2
CATEGORIES=	editors gnustep
MASTER_SITES=	http://git.savannah.gnu.org/cgit/backbone.git/snapshot/
DISTNAME=	backbone-6343263e17c5cd771770dabc2559ac07ffedcf29

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic text editor for GNUstep
LICENSE=	other

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

USE_GNUSTEP_MAKE_DIRS=	System/Applications/TextEdit
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

.include <bsd.port.mk>
