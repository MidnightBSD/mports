PORTNAME=	librest
PORTVERSION=	0.10.2
PORTREVISION=	0
CATEGORIES=	net devel gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	1

MAINTAINER=	ports@MidinghtBSD.org
COMMENT=	GNOME REST library
WWW=		https://gitlab.gnome.org/GNOME/librest

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libadwaita-1.so:x11-toolkits/libadwaita \
		libjson-glib-1.0.so:devel/json-glib \
		libsoup-3.0.so:devel/libsoup3

PORTSCOUT=	limitw:1,even

USES=		gettext gnome localbase meson pkgconfig python tar:xz
USE_GNOME=	glib20 gtksourceview5 introspection:build libxml2
USE_LDCONFIG=	yes
MESON_ARGS=	-Dca_certificates=true \
		-Dca_certificates_path=/etc/ssl/cert.pem \
		-Dgtk_doc=false
NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gi-docgen>0:textproc/py-gi-docgen@${PY_FLAVOR}
DOCS_MESON_TRUE=	gtk_doc

.include <bsd.port.mk>
