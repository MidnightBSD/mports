# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/devel/libgit2-glib/Makefile 386103 2015-05-11 20:56:01Z kwm $

PORTNAME=	libgit2-glib
PORTVERSION=	0.22.8
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Glib wrapper library around the libgit2 git access library

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	vapigen:${PORTSDIR}/lang/vala \
		gtkdoc-check:${PORTSDIR}/textproc/gtk-doc
LIB_DEPENDS=	libgit2.so:${PORTSDIR}/devel/libgit2

USES=		gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	glib20 gnomeprefix gtk30 intlhack introspection
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ARGS=	--disable-python
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
