PORTNAME=	gtksourceview2
PORTVERSION=	2.10.5
PORTREVISION?=	8
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DISTNAME=	${PORTNAME:S/2$//}-${DISTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Widget that adds syntax highlighting to GtkTextView

LICENSE=	gpl2

USE_GCC=	yes
USES=		gettext gmake gnome libtool localbase pathfix pkgconfig tar:bzip2
USE_GNOME=	gnomeprefix gtk20 libxml2 intlhack
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes

INSTALL_TARGET=	install-strip
PORTSCOUT=	ignore:1

CONFIGURE_ARGS=	--enable-compile-warnings=no \
		--enable-glade-catalog=no \
		--disable-gtk-doc-html

.include <bsd.port.mk>
