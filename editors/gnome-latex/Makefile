PORTNAME=	gnome-latex
PORTVERSION=	3.44.0
CATEGORIES=	editors
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integrated LaTeX environment
WWW=		https://wiki.gnome.org/Apps/LaTeXila

LICENSE=	gpl3

BUILD_DEPENDS=	itstool:textproc/itstool \
		gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libfribidi.so:converters/fribidi \
		libenchant-2.so:textproc/enchant2 \
		libgedit-amtk-5.so:x11-toolkits/amtk \
		libgedit-gtksourceview-300.so:x11-toolkits/libgedit-gtksourceview \
		libgedit-tepl-6.so:x11-toolkits/tepl6 \
		libgspell-1.so:textproc/gspell

USES=		compiler:c11 desktop-file-utils gettext gmake gnome \
		pkgconfig tar:xz tex vala:build
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
USE_GNOME=	cairo dconf gtk30 intltool
USE_TEX=	latex dvipsk
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	NLS
NLS_USES=	gettext-runtime
NLS_CONFIGURE_ENABLE=	nls
OPTIONS_SUB=	yes

GLIB_SCHEMAS=	org.gnome.gnome-latex.gschema.xml

.include <bsd.port.pre.mk>

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-patch:
	${REINPLACE_CMD} -e 's|amtk-5|libgedit-amtk-5|g' \
		-e 's|gtksourceview-4|libgedit-gtksourceview-300|g' \
		-e 's|tepl-6|libgedit-tepl-6|g' \
		${WRKSRC}/configure
	${REINPLACE_CMD} -e 's|GtkSource-4|GtkSource-300|g' \
		${WRKSRC}/src/liblatexila/Makefile.in \
		${WRKSRC}/src/Makefile.in

.include <bsd.port.post.mk>
