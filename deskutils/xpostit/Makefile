# $MidnightBSD: mports/deskutils/xpostit/Makefile,v 1.4 2013/07/09 00:55:30 laffer1 Exp $

PORTNAME=	xpostit
PORTVERSION=	3.3.1
PORTREVISION=	2
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
