# Created by: Adam Weinberger <adamw@FreeBSD.org>

PORTNAME=	libcroco
PORTVERSION=	0.6.13
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS2 parsing library

LICENSE=	lgpl2.1

GNU_CONFIGURE=	yes
USES=		cpe gettext gmake gnome libtool pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	glib20 libxml2
CONFIGURE_ARGS=	--disable-gtk-doc-html
INSTALL_TARGET=	install-strip
CPE_VENDOR=	gnome

PLIST_SUB=	VERSION="0.6"

.include <bsd.port.mk>
