# New ports collection makefile for:	pixman
# Date Created:				Aug 9 2003
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/pixman/Makefile,v 1.3 2007/09/15 13:58:26 flz Exp $
# $MidnightBSD$
#

PORTNAME=	pixman
PORTVERSION=	0.9.5
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
LICENSE=	x11

XORG_CAT=	lib

post-patch:
	@${REINPLACE_CMD} -e 's|gtk+-2\.0|disable-gtk|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
