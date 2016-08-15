# $MidnightBSD$

PORTNAME=	gtksourceview
PORTVERSION=	2.10.1
PORTREVISION=	1
CATEGORIES=	x11-toolkits gnome python
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/pygtksourceview/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pygtksourceview-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the version 2 of the GtkSourceView library

LICENSE=	lgpl

USES=		gmake libtool:keepla pathfix pkgconfig python tar:bzip2
USE_GNOME=	gnomeprefix gtksourceview2 pygtk2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docs
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
