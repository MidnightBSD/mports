# $MidnightBSD$
# $FreeBSD: head/devel/goffice010/Makefile 384250 2015-04-18 19:17:32Z kwm $

PORTNAME=	goffice
PORTVERSION=	0.10.27
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	010

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib/GTK+ set of document centric objects and utilities

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GNOME=	gtk30 intlhack introspection:build libgsf librsvg2 libxslt
USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_XORG=	xrender xext
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--with-lasem=no --with-config-backend=gsettings \
		--enable-compile-warnings=no \
		--enable-introspection

PLIST_SUB=	VERSION=${PORTVERSION} SHORT_VER=${PORTVERSION:R}

post-install:
	@${MKDIR} ${PREFIX}/lib/goffice/${SHORT_VER}/plugins
	@${STRIP_CMD} ${PREFIX}/lib/libgoffice-0.10.so.*
	@${STRIP_CMD} ${PREFIX}/lib/goffice/${PORTVERSION}/plugins/*/*.so

.include <bsd.port.mk>
