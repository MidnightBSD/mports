# New ports collection makefile for:   xpostit
# Date created:        3 Dec 2007
# Whom:                laffer1
#
# $MidnightBSD: mports/deskutils/xpostit/Makefile,v 1.3 2008/03/23 19:53:25 laffer1 Exp $
# $FreeBSD: ports/deskutils/xpostit/Makefile,v 1.15 2007/05/19 20:01:57 flz Exp $
#

PORTNAME=	xpostit
PORTVERSION=	3.3.1
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	ftp://ftp.x.org/R5contrib/
DISTNAME=	${PORTNAME}${PORTVERSION}
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PostIt (R) messages onto your X11 screen
LICENSE=	unknown

USES=		imake
USE_XORG=	ice sm x11 xaw xext xmu xpm xt
WRKSRC=		${WRKDIR}/xpostit
MAN1=		xpostit.1

.include <bsd.port.mk>
