# $MidnightBSD: mports/x11-servers/x2x/Makefile,v 1.3 2009/03/15 20:19:50 laffer1 Exp $

PORTNAME=	x2x
PORTVERSION=	1.27
PORTREVISION=	3
CATEGORIES=	x11-servers
MASTER_SITES=	http://gatekeeper.dec.com/pub/DEC/SRC/x2x/
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program to link multiple X servers together
LICENSE=	unknown

USE_XORG=	x11
USE_IMAKE=	yes
USE_GMAKE=	yes
MAKE_ENV=	MAKE=${GMAKE}
MAN1=		x2x.1
PLIST_FILES=	bin/x2x

.include <bsd.port.mk>
