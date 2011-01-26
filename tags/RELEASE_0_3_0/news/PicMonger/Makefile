# New ports collection makefile for:	PicMonger
# Date created:			23 July 2000
# Whom:				Donald Burr <dburr@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/news/PicMonger/Makefile,v 1.21 2008/03/25 22:44:45 miwi Exp $
#

PORTNAME=	PicMonger
PORTVERSION=	0.9.6
PORTREVISION=	0
CATEGORIES=	news graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=picmonger

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An automated USENET (NNTP) picture decoding client
LICENSE=	gpl2

LIB_DEPENDS=	gtkmm-1.2.2:${PORTSDIR}/x11-toolkits/gtkmm12
RUN_DEPENDS=	mpack:${PORTSDIR}/converters/mpack

USE_XORG=	x11
USE_GMAKE=	yes
USE_GNOME=	imlib
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
