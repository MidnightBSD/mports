# New ports collection makefile for:	libart_lgpl2
# Date created:		8 July 2001
# Whom:			Hye-Shik Chang <perky@python.or.kr>
# 
# $MidnightBSD: mports/graphics/libart_lgpl/Makefile,v 1.2 2007/04/29 02:35:09 ctriv Exp $
# $FreeBSD: ports/graphics/libart_lgpl/Makefile,v 1.34 2006/05/28 13:37:05 pav Exp $
#

PORTNAME=	libart_lgpl
PORTVERSION=	2.3.20
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME:S/2$//}/2.3
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for high-performance 2D graphics

USE_BZIP2=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes

CONFLICTS=	libart-[0-9]*

.include <bsd.port.mk>
