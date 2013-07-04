# $MidnightBSD: mports/graphics/pixen/Makefile,v 1.1 2010/05/30 22:36:54 laffer1 Exp $

PORTNAME=	pixen
PORTVERSION=	0.1
PORTREVISION=	1
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/gsimageapps/
DISTNAME=	Pixen-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphics editing software for small-scale pictures for GNUstep
LICENSE=	mit

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

ADDITIONAL_OBJCFLAGS+=	-Dlog2=logb

.include <bsd.port.mk>
