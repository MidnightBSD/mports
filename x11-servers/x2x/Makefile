# $MidnightBSD: mports/x11-servers/x2x/Makefile,v 1.5 2009/05/26 00:38:07 laffer1 Exp $

PORTNAME=	x2x
PORTVERSION=	1.27
PORTREVISION=	4
CATEGORIES=	x11-servers
MASTER_SITES=	http://cloud.github.com/downloads/dottedmag/x2x/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program to link multiple X servers together
LICENSE=	unknown

USE_XORG=	x11 xext xtst
USE_IMAKE=	yes
USE_GMAKE=	yes
MAKE_ENV=	MAKE=${GMAKE}
MAN1=		x2x.1
PLIST_FILES=	bin/x2x

.include <bsd.port.mk>
