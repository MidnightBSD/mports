PORTNAME=	libfm
DISTVERSION=	1.3.2
PORTREVISION=	4
CATEGORIES=	x11
MASTER_SITES=	SF/pcmanfm/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT?=	Core library of PCManFM file manager
WWW=		https://wiki.lxde.org/en/Libfm

LICENSE=	gpl2+ lgpl2.1+
LICENSE_COMB=	multi
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING

.if ! defined(EXTRA_ONLY)
USES+=		vala:build
BUILD_DEPENDS=	p5-XML-Parser>=0:textproc/p5-XML-Parser
LIB_DEPENDS=	libmenu-cache.so:x11/menu-cache \
		libexif.so:graphics/libexif \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz \
		libfm-extra.so:x11/libfm-extra

FLAVORS=	gtk2 gtk3
FLAVOR?=	${FLAVORS:[1]}

gtk3_PKGNAMESUFFIX=	-gtk3

gtk2_CONFLICTS_INSTALL=	libfm-gtk3
gtk3_CONFLICTS_INSTALL=	libfm
.endif

SLAVEDIRS=	${CATEGORIES}/${PORTNAME}-extra

USES=		gettext-tools gmake gnome libtool localbase \
		pkgconfig tar:xz
USE_GNOME=	intltool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--sysconfdir=${LOCALBASE}/etc --disable-static

.if ! defined(EXTRA_ONLY)
.  if ${FLAVOR:Mgtk2}
USES+=		desktop-file-utils shared-mime-info
USE_GNOME+=	gtk20 cairo gdkpixbuf
CONFIGURE_ARGS+=	--with-gtk=2
PLIST_SUB=	GTKVERSION=gtk
.  elif ${FLAVOR:Mgtk3}
USES+=		desktop-file-utils shared-mime-info
USE_GNOME+=	gtk30 cairo gdkpixbuf
CONFIGURE_ARGS+=	--with-gtk=3
PLIST_SUB=	GTKVERSION=gtk3
.  endif
.else
USE_GNOME+=	glib20
CONFIGURE_ARGS+=	--with-extra-only
.endif

INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime:build
NLS_CONFIGURE_ENABLE=	nls

post-extract:
.if ! defined(EXTRA_ONLY)
	@${MV} ${WRKSRC}/data/libfm.conf \
		${WRKSRC}/data/libfm.conf.sample
.endif

	${MKDIR} -p ${FAKED_DESTDIR}${PREFIX}/include/${PORTNAME}

post-patch:
	${REINPLACE_CMD} -e 's|^[[:blank:]]\{5,\}USE_NLS=yes|#&|' \
		${WRKSRC}/configure

	${REINPLACE_CMD} -e '/^pkgincludedir/s|-@FMLIBVER@||; \
		/@LN_S@ @PACKAGE@-@FMLIBVER@/d' ${WRKSRC}/src/Makefile.in

.if ! defined(EXTRA_ONLY)
	${REINPLACE_CMD} -e 's|DATA = libfm-extra.pc|DATA =|' \
		${WRKSRC}/Makefile.in

	${REINPLACE_CMD} -e '/^LIBFM_EXTRA_INCLUDES/,+4 s|^|@EXTRALIB_ONLY_TRUE@|; \
		/FALSE@lib_LTLIBRARIES/s| libfm-extra.la||; \
		s|libfm-extra.la \\|-lfm-extra \\|' \
		${WRKSRC}/src/Makefile.in

	${REINPLACE_CMD} -e 's|-@FMLIBVER@||' ${WRKSRC}/src/actions/Makefile.in

	${REINPLACE_CMD} -e '/^vfs_menu_la_DEPENDENCIES/{s| \\||;n;d;}; \
		/^vfs_menu_la_LIBADD/s|$$(top.*|-lfm-extra|' \
		${WRKSRC}/src/modules/Makefile.in

	${REINPLACE_CMD} -e 's|libfm.conf|libfm.conf.sample|' \
		${WRKSRC}/data/Makefile.in

post-install:
	${INSTALL_DATA} ${WRKSRC}/src/actions/fm-actions.h \
		${STAGEDIR}${PREFIX}/include/${PORTNAME}
.endif

.include <bsd.port.mk>
