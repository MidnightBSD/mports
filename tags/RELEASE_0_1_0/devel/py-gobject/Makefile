# New ports collection makefile for:	py-gobject
# Date created:				10 January 2006
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/py-gobject/Makefile,v 1.5 2006/11/18 20:38:02 marcus Exp $
#   $MCom: ports/devel/py-gobject/Makefile,v 1.17 2006/10/03 20:44:25 ahze Exp $

PORTNAME=	gobject
PORTVERSION=	2.12.3
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/pygobject/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pygobject-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for GObject

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docs

CONFLICTS=	py*-gtk-0*

.include <bsd.port.mk>
