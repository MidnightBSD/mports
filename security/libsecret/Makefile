PORTNAME=	libsecret
PORTVERSION=	0.21.8.2
PORTREVISION=	0
CATEGORIES=	security gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to access the secret service API
WWW=		https://wiki.gnome.org/Projects/Libsecret/

LICENSE=	Apache-2.0 gpl2+ lgpl2.1+
LICENSE_COMB=	multi
LICENSE_FILE_Apache-2.0=	${WRKSRC}/COPYING.TESTS
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING.TESTS
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gi-docgen>0:textproc/py-gi-docgen@${PY_FLAVOR} \
		docbook-xsl>=0:textproc/docbook-xsl
LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error

USES=		compiler gnome meson pkgconfig python tar:xz vala:build
USE_GNOME=	glib20 intltool introspection:build libxslt:build
USE_LDCONFIG=	yes

NO_TEST=	yes
MESON_ARGS+=	-Dbash_completion=disabled
TESTING_UNSAFE=	gi.repository.GLib.GError: g-io-error-quark: Remote closed the output

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == clang
CFLAGS+=	-Wno-incompatible-function-pointer-types
.endif

.include <bsd.port.post.mk>
