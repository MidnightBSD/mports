# $MidnightBSD$

PORTNAME=	json-glib
PORTVERSION=	1.4.2
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON (RFC 4627) interface for Glib

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

# for magus ninja 
PATCH_DEPENDS=	python2.7:lang/python27

USES=		gettext localbase meson pkgconfig tar:xz
USE_GNOME=	glib20
USE_LDCONFIG=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	GIR DOCS
OPTIONS_DEFAULT=GIR
OPTIONS_SUB=	yes

GIR_DESC=	Build introspection data
GIR_USE=	gnome=introspection
GIR_MESON_TRUE=	introspection

post-install:
	@${RM} -r ${STAGEDIR}${PREFIX}/libexec/installed-tests
	@${RM} -r ${STAGEDIR}${PREFIX}/share/installed-tests

.include <bsd.port.mk>
