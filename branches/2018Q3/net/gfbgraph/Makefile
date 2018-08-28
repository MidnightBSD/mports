# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/net/gfbgraph/Makefile 377090 2015-01-15 13:27:53Z kwm $

PORTNAME=	gfbgraph
PORTVERSION=	0.2.2
CATEGORIES=	net www
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject library for Facebook Graph API

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gtkdoc-rebase:${PORTSDIR}/textproc/gtk-doc
LIB_DEPENDS=	librest-0.7.so:${PORTSDIR}/devel/librest \
		libgoa-1.0.so:${PORTSDIR}/net/gnome-online-accounts \
		libjson-glib-1.0.so:${PORTSDIR}/devel/json-glib

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	glib20 intlhack introspection:build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

post-patch:
	${REINPLACE_CMD} -e 's|/doc/libgfbgraph|/share/doc/libgfbgraph|g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
