# $MidnightBSD$

PORTNAME=	glade
PORTVERSION=	3.18.3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User interface builder for GTK+ 3

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

BUILD_DEPENDS=	itstool:textproc/itstool

CONFLICTS=	glade3-3.*
PORTSCOUT=	limitw:1,even

USES=		desktop-file-utils gettext gmake libtool \
		localbase:ldflags pathfix pkgconfig python:3.4+ tar:xz
USE_GNOME=	gtk30 gnomedocutils intlhack pygobject3
#		introspection:build
# temp disable, introspection generation crashes with GNOME 3.15
CONFIGURE_ARGS=	--disable-introspection --enable-python
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-Wno-error=format-nonliteral
INSTALL_TARGET=	install-strip

DOCSDIR=	${PREFIX}/share/doc/gladeui-2

.include <bsd.port.mk>
