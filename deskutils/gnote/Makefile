PORTNAME=	gnote
PORTVERSION=	42.1
PORTREVISION=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ version of Tomboy, note taking application
WWW=		https://wiki.gnome.org/Apps/Gnote

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libenchant.so:textproc/enchant \
		libgtkspell3-3.so:textproc/gtkspell3 \
		libsecret-1.so:security/libsecret \
		libuuid.so:misc/e2fsprogs-libuuid

PORTSCOUT=	limitw:1,even

USE_GNOME=	gtkmm30 intltool libxml2 libxslt
USE_XORG=	x11
USES=		compiler:c++11-lib desktop-file-utils gettext gnome localbase \
		meson pathfix pkgconfig python:build tar:xz xorg
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
BINARY_ALIAS=	python3=${PYTHON_VERSION}

GLIB_SCHEMAS=	org.gnome.gnote.gschema.xml

DOCS=		AUTHORS ChangeLog NEWS README TODO

PLIST_SUB+=	SVER=${PORTVERSION:R} \
		VERSION=${PORTVERSION}

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for i in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
