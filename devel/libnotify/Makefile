PORTNAME=	libnotify
DISTVERSION=	0.7.12
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for desktop notifications

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	xsltproc:textproc/libxslt \
		docbook-xsl-ns>=0:textproc/docbook-xsl-ns

USES=		gmake gnome libtool meson pkgconfig tar:xz
USE_GNOME=	glib20 gdkpixbuf2 introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dtests=false -Ddocbook_docs=disabled -Dgtk_doc=false

post-patch:
	${REINPLACE_CMD} -e "s#http:.*docbook.xsl#${LOCALBASE}/share/xsl/docbook-ns/manpages/docbook.xsl#g" \
		${WRKSRC}/meson.build

.include <bsd.port.mk>
