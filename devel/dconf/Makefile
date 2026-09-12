PORTNAME=	dconf
PORTVERSION=	0.49.0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DISTNAME=	dconf-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configuration database system for GNOME
WWW=		https://gitlab.gnome.org/GNOME/dconf

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	docbook-xsl>=0:textproc/docbook-xsl \
		${LOCALBASE}/libdata/pkgconfig/bash-completion.pc:shells/bash-completion \
		${LOCALBASE}/bin/as:devel/binutils
LIB_DEPENDS=	libdbus-1.so:devel/dbus

USES=		gettext gnome localbase meson pkgconfig python:build \
		shebangfix tar:xz vala:build
USE_CSTD=	c99
USE_GNOME=	glib20 libxslt:build
USE_LDCONFIG=	yes
.if ${/usr/bin/ld:L:tA} != /usr/bin/ld.lld
USE_BINUTILS=	yes
LDFLAGS+=	-B${LOCALBASE}/bin
.endif
BINARY_ALIAS=	python3=${PYTHON_VERSION}
SHEBANG_FILES=	tests/test-dconf.py

# magus
NO_TEST=	yes
TESTING_UNSAFE=	some tests fail

post-install:
	@${MKDIR} ${PREFIX}/etc/dconf/db
	@${MKDIR} ${PREFIX}/etc/dconf/profile

.include <bsd.port.mk>
