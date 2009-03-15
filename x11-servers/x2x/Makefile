# New ports collection makefile for:	x2x
# Date created:		3 September 2000
# Whom:			grog
#
# $FreeBSD: ports/x11-servers/x2x/Makefile,v 1.7 2004/02/06 13:12:46 trevor Exp $
# $MidnightBSD: mports/x11-servers/x2x/Makefile,v 1.2 2007/10/25 04:38:01 laffer1 Exp $
#

PORTNAME=	x2x
PORTVERSION=	1.27
PORTREVISION=	3
CATEGORIES=	x11-servers
MASTER_SITES=	http://gatekeeper.dec.com/pub/DEC/SRC/x2x/
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program to link multiple X servers together
LICENSE=	unknown

USE_XORG=	x11 xlib
USE_IMAKE=	yes
USE_GMAKE=	yes
MAKE_ENV=	MAKE=${GMAKE}
MAN1=		x2x.1
PLIST_FILES=	bin/x2x

.include <bsd.port.mk>
