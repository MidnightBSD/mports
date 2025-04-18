# Also update devel/libgit2, devel/rubygem-rugged, devel/py-pygit2

PORTNAME=	libgit2-glib
PORTVERSION=	1.2.0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Glib wrapper library around the libgit2 git access library
WWW=		https://gitlab.gnome.org/GNOME/libgit2-glib

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS+=	/usr/local/lib/libgit2.so.1.7.2:devel/libgit2
BUILD_DEPENDS+= ${LOCALBASE}/lib/libcrypto.so.12:security/openssl
LIB_DEPENDS=	libgit2.so:devel/libgit2
RUN_DEPENDS+= ${LOCALBASE}/lib/libcrypto.so.12:security/openssl

USES=		compiler:c11 gnome localbase \
		meson pkgconfig python:build ssl tar:xz vala:build
USE_GNOME=	glib20 introspection
USE_LDCONFIG=	yes
MESON_ARGS=	-Dpython=false
BINARY_ALIAS=	python3=${PYTHON_VERSION}
_SSL_RUN_DEP=yes

# XXX: meson_vapi_link.py does not respect STAGEDIR for some reason and silently
# fails when building as user and touches the external fs when building as root.
# Neutralize it.  We replicate what it does in post-install.
post-patch:
	@${ECHO_CMD} '#!/bin/sh' > ${WRKSRC}/meson_vapi_link.py

post-install:
	${RLN} ${PREFIX}/share/vala/vapi/libgit2-glib-1.0.deps \
		${PREFIX}/share/vala/vapi/ggit-1.0.deps
	${RLN} ${PREFIX}/share/vala/vapi/libgit2-glib-1.0.vapi \
		${PREFIX}/share/vala/vapi/ggit-1.0.vapi

.include <bsd.port.mk>
