# Created by: Gustau Perez i Querol <gustau.perez@gmail.com>
# $FreeBSD: head/deskutils/gnote/Makefile 412346 2016-04-01 14:00:51Z mat $
# $MidnightBSD$

PORTNAME=	gnote
PORTVERSION=	3.18.1
PORTREVISION=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ version of Tomboy, note taking application

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libpcre.so:devel/pcre \
		libgtkspell3-3.so:textproc/gtkspell3 \
		libboost_filesystem.so:devel/boost-libs \
		libsecret-1.so:security/libsecret \
		libuuid.so:misc/e2fsprogs-libuuid

USE_GNOME=	gtk30 gtkmm30 intltool libxml2 libxslt
USES=		desktop-file-utils compiler:c++11-lib gettext gmake \
		gnome libtool pathfix pkgconfig tar:xz
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-dbus-service-dir=${PREFIX}/share/dbus-1/services
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.gnote.gschema.xml

DOCS=		AUTHORS ChangeLog NEWS README TODO

PLIST_SUB+=	VERSION=${PORTVERSION}

.include <bsd.mport.options.mk>

post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
