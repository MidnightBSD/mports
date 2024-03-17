PORTNAME=	libsecret
PORTVERSION=	0.20.5
PORTREVISION=	2
CATEGORIES=	security gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to access the secret service API
WWW=		https://wiki.gnome.org/Projects/Libsecret/

LICENSE=	lgpl2.1

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gi-docgen>0:textproc/py-gi-docgen@${PY_FLAVOR} \
		docbook-xsl>=0:textproc/docbook-xsl
LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error

USES=		compiler gnome meson pkgconfig python tar:xz vala:build
USE_GNOME=	glib20 intltool introspection:build libxslt:build

NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == clang
CFLAGS+=	-Wno-incompatible-function-pointer-types
.endif

.include <bsd.port.post.mk>
