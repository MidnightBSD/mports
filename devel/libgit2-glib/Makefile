# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/devel/libgit2-glib/Makefile 386103 2015-05-11 20:56:01Z kwm $

PORTNAME=	libgit2-glib
PORTVERSION=	0.26.0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Glib wrapper library around the libgit2 git access library

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	vapigen:lang/vala
LIB_DEPENDS=	libgit2.so:devel/libgit2

USES=		compiler:c11 gmake libtool localbase \
		pathfix pkgconfig tar:xz
USE_GNOME=	glib20 gnomeprefix introspection
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ARGS=	--disable-python
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
