PORTNAME=	tracker
PORTVERSION=	3.1.2
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object database, tag/metadata database, search tool and indexer

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LGPL

BUILD_DEPENDS=	valac:lang/vala \
		${LOCALBASE}/bin/sqlite3:databases/sqlite3
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libicutu.so:devel/icu \
		libjson-glib-1.0.so:devel/json-glib \
		libsoup-2.4.so:devel/libsoup \
		libuuid.so:misc/e2fsprogs-libuuid
RUN_DEPENDS=	${LOCALBASE}/bin/sqlite3:databases/sqlite3

USES=		compiler:c++11-lib gettext gnome localbase:ldflags meson \
		pkgconfig python:3.6+,build sqlite tar:xz
USE_GNOME=	glib20 libxml2 introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dbash_completion=true \
		-Dbash_completion_dir=${PREFIX}/etc/bash_completion.d \
		-Ddocs=false \
		-Dstemmer=disabled \
		-Dsystemd_user_services=false \
		-Dtest=false

DATADIR=	${PREFIX}/share/${PORTNAME}${PKGNAMESUFFIX}
BINARY_ALIAS=	python3=${PYTHON_CMD}
PORTSCOUT=	limitw:1,even

PLIST_SUB=	LIBVER=0.304.0

OPTIONS_DEFINE=		DOCS MAN
OPTIONS_SUB=		yes
DOCS_BUILD_DEPENDS=	gtk-doc>0:textproc/gtk-doc
DOCS_MESON_TRUE=	docs
MAN_BUILD_DEPENDS=	asciidoc:textproc/asciidoc
MAN_MESON_TRUE=		man
MAN_DESC=		Install manual pages

NO_TEST=	yes

post-patch:
	${REINPLACE_CMD} -e 's|/etc/asciidoc|${PYTHONPREFIX_SITELIBDIR}/asciidoc/resources|' \
		${WRKSRC}/docs/manpages/meson.build

.include <bsd.port.mk>
