PORTNAME=	dconf
PORTVERSION=	0.40.0
PORTREVISION=	2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DISTNAME=	dconf-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configuration database system for GNOME
WWW=		https://wiki.gnome.org/Projects/dconf

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	docbook-xsl>=0:textproc/docbook-xsl \
		${LOCALBASE}/libdata/pkgconfig/bash-completion.pc:shells/bash-completion \
		${LOCALBASE}/bin/as:devel/binutils
LIB_DEPENDS=	libdbus-1.so:devel/dbus

PORTSCOUT=	limitw:1,even

USES=		gettext gnome localbase meson pkgconfig python:build tar:xz vala:build
USE_CSTD=	c99
USE_GNOME=	glib20 libxslt:build
USE_LDCONFIG=	yes
.if ${/usr/bin/ld:L:tA} != /usr/bin/ld.lld
USE_BINUTILS=	yes
LDFLAGS+=	-B${LOCALBASE}/bin
.endif
BINARY_ALIAS=	python3=${PYTHON_VERSION}

MESON_ARGS=	-Dman=true \
		-Dgtk_doc=false \
		-Dvapi=true

# magus
NO_TEST=	yes

post-install:
	@${MKDIR} ${PREFIX}/etc/dconf/db
	@${MKDIR} ${PREFIX}/etc/dconf/profile

.include <bsd.port.mk>
