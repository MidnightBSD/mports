# $MidnightBSD: mports/x11-toolkits/py-gtksourceview/Makefile,v 1.3 2008/06/08 18:41:18 laffer1 Exp $

PORTNAME=	gtksourceview
PORTVERSION=	2.6.0
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

post-patch:
	@${REINPLACE_CMD} -e 's| == x| = x|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
