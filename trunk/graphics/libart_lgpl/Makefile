# New ports collection makefile for:	libart_lgpl2
# Date created:		8 July 2001
# Whom:			Hye-Shik Chang <perky@python.or.kr>
# 
# $MidnightBSD$

PORTNAME=	libart_lgpl
PORTVERSION=	2.3.21
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	GNOME
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for high-performance 2D graphics
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack
USE_PKGCONFIG=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes

CONFLICTS=	libart-[0-9]*

.include <bsd.port.mk>
