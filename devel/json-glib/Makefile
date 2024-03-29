# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>

PORTNAME=	json-glib
PORTVERSION=	1.6.2
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON (RFC 4627) interface for Glib

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext gnome localbase meson python:3.5+ pkgconfig tar:xz
USE_GNOME=	glib20
USE_LDCONFIG=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	GIR DOCS
OPTIONS_DEFAULT=GIR
OPTIONS_SUB=	yes
MESON_ARGS=	-Dgtk_doc=disabled

BINARY_ALIAS=	python3=${PYTHON_CMD}

DOCS_BUILD_DEPENDS=	gtk-doc>0:textproc/gtk-doc
DOCS_MESON_ENABLED=	gtk_doc
GIR_DESC=	Build introspection data
GIR_USE=	gnome=introspection
GIR_MESON_ENABLED=	introspection

post-install:
	@${RM} -r ${STAGEDIR}${PREFIX}/libexec/installed-tests
	@${RM} -r ${STAGEDIR}${PREFIX}/share/installed-tests

.include <bsd.port.mk>
