PORTNAME=	gnome-themes
PORTVERSION=	2.32.1
PORTREVISION=	3
CATEGORIES=	x11-themes gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of themes and icons for GNOME2

LICENSE=	lgpl

BUILD_DEPENDS=	gtk-engines2>=2.15.0:x11-themes/gtk-engines2 \
		icon-naming-utils>=0.8.7:x11-themes/icon-naming-utils
RUN_DEPENDS=	gtk-engines2>=2.15.0:x11-themes/gtk-engines2

CONFLICTS=	clearlooks-metacity-0.*

USES=		gettext gmake gnome pkgconfig python:3.7,build tar:bzip2
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix intlhack metacity gtk20
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
