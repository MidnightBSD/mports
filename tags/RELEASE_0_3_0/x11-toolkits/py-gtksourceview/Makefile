# $MidnightBSD: mports/x11-toolkits/py-gtksourceview/Makefile,v 1.4 2009/12/14 00:20:57 laffer1 Exp $

PORTNAME=	gtksourceview
PORTVERSION=	2.10.1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/pygtksourceview/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pygtksourceview-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A python bindings for the version 2 of the GtkSourceView library
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomeprefix gtksourceview2 pygtk2
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docs

.include <bsd.port.mk>
