PORTNAME=	glibmm
PORTVERSION=	2.80.1
CATEGORIES=	devel
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	26
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interfaces for glib2
WWW=		https://www.gtkmm.org/

LICENSE=	lgpl2.1

USES=		compiler:c++11-lang gettext gnome meson pathfix perl5 \
		pkgconfig python:build shebangfix tar:xz
USE_GNOME=	glib20 libsigc++30
USE_LDCONFIG=	yes

SHEBANG_GLOB=	*.py

MESON_ARGS=	-Dbuild-documentation=false

PORTSCOUT=	limitw:1,even
PLIST_SUB=	VERSION=2.68

NO_TEST=	yes

.include <bsd.port.mk>
