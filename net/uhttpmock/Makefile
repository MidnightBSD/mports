PORTNAME=	uhttpmock
PORTVERSION=	0.5.3
PORTREVISION=	1
CATEGORIES=	net gnome
MASTER_SITES=	http://tecnocode.co.uk/downloads/uhttpmock/
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP web service mocking library for GNOME
WWW=		https://gitlab.freedesktop.org/pwithnall/uhttpmock

LICENSE=      lgpl2.1                                                         
LICENSE_FILE= ${WRKSRC}/COPYING  

BUILD_DEPENDS=	gnome-autogen.sh:devel/gnome-common
LIB_DEPENDS=	libsoup-2.4.so:devel/libsoup

USES=		gettext gmake gnome libtool pathfix pkgconfig tar:xz vala:build
USE_GNOME=	gnomeprefix gtk20 introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--disable-Werror

INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

DOCS_BUILD_DEPENDS=	gtkdocize:textproc/gtk-doc
DOCS_MESON_TRUE=	gtk_doc

.include <bsd.port.mk>
