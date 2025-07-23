PORTNAME=	gspell
PORTVERSION=	1.8.1
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Spell checking for GTK+
WWW=		https://gitlab.gnome.org/GNOME/gspell

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	iso-codes>=3.57:misc/iso-codes
LIB_DEPENDS=	libenchant-2.so:textproc/enchant2 \
		libfribidi.so:converters/fribidi

PORTSCOUT=	limitw:even

USES=		gmake gnome iconv libtool pathfix pkgconfig tar:xz vala:build
USE_GNOME=	atk cairo gdkpixbuf glib20 gtk30 introspection:build \
		libxml2 pango
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig

OPTIONS_DEFINE=	NLS
NLS_USES=	gettext-tools
NLS_CONFIGURE_ENABLE=	nls
OPTIONS_SUB=	yes

.include <bsd.port.mk>
