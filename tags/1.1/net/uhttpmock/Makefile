# $MidnightBSD$

PORTNAME=	uhttpmock
PORTVERSION=	0.5.1
CATEGORIES=	net gnome
MASTER_SITES=	http://tecnocode.co.uk/downloads/uhttpmock/
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP web service mocking library for GNOME

LICENSE=      lgpl2.1                                                         
LICENSE_FILE= ${WRKSRC}/COPYING  

BUILD_DEPENDS=	gnome-autogen.sh:devel/gnome-common \
		vapigen:lang/vala \
		gtkdoc-rebase:textproc/gtk-doc
LIB_DEPENDS=	libsoup-2.4.so:devel/libsoup

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix gtk20 introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--disable-Werror

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
