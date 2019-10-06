PORTNAME?=	gimp-app
PORTVERSION=	2.8.16
PORTREVISION?=	3
PORTEPOCH?=	1
CATEGORIES?=	graphics gnome
MASTER_SITES=	GIMP/gimp/v${PORTVERSION:R}
DISTNAME=	gimp-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Image Manipulation Program

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:misc/iso-codes
LIB_DEPENDS=	libpng.so:graphics/png \
		libtiff.so:graphics/tiff \
		liblcms2.so:graphics/lcms2 \
		libgegl-0.2.so:graphics/gegl \
		libbabl-0.1.so:x11/babl
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:misc/iso-codes

GNU_CONFIGURE=	yes
USES+=	cpe	desktop-file-utils gettext gmake jpeg libtool pathfix \
		pkgconfig tar:bzip2
USE_XORG=	xpm xmu xext
USE_GNOME+=	intlhack gtk20
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS?=--with-html-dir=${PREFIX}/share/doc/gimp \
		--disable-gtk-doc \
		--without-linux-input \
		--with-print \
		--enable-default-binary \
		--with-lcms=lcms2 \
		--disable-gimp-console \
		--disable-python \
		--with-desktop-dir=${PREFIX}/share \
		--docdir=${PREFIX}/share/doc/gimp \
		--enable-default-binary
CONFIGURE_ENV=	GIMP_THREAD_LIBS=-lpthread
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
CPE_PRODUCT=	gimp
CPE_VENDOR=	gnu

PLIST_SUB+=	LIBVER=0.800.16

.if !defined(GIMP_SLAVE)

OPTIONS_DEFINE?=	AA DBUS LIBEXIF GHOSTSCRIPT GVFS JASPER \
			LIBMNG LIBRSVG2 POPPLER SIMD WMF
OPTIONS_DEFAULT=	AA DBUS LIBEXIF GVFS LIBMNG LIBRSVG2 \
			POPPLER WMF
AA_DESC=		Ascii-art Plug-in

.endif

.include <bsd.mport.options.mk>

.if defined(GIMP_SLAVE)
PKG_CONFIG?=	${LOCALBASE}/bin/pkg-config
GIMP_LIBS=	`${PKG_CONFIG} --libs gimp-2.0`
GIMP_THUMB_LIBS=`${PKG_CONFIG} --libs gimpthumb-2.0`
GIMP_UI_LIBS=	`${PKG_CONFIG} --libs gimpui-2.0`

LIB_DEPENDS+=	libgimp-2.0.so:graphics/gimp-app

.else

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=	--enable-debug
.endif

.if ${PORT_OPTIONS:MAA}
LIB_DEPENDS+=		libaa.so:graphics/aalib
PLIST_SUB+=		AA=""
.else
CONFIGURE_ARGS+=	--without-aa
PLIST_SUB+=		AA="@comment "
.endif

.if ${PORT_OPTIONS:MDBUS}
LIB_DEPENDS+=		libdbus-glib-1.so:devel/dbus-glib
CONFIGURE_ARGS+=	--with-dbus
.else
CONFIGURE_ARGS+=	--without-dbus
.endif

.if ${PORT_OPTIONS:MGHOSTSCRIPT}
USES+=	ghostscript
CONFIGURE_ARGS+=	--with-gs
PLIST_SUB+=		GS=""
.else
CONFIGURE_ARGS+=	--without-gs
PLIST_SUB+=		GS="@comment "
.endif

.if ${PORT_OPTIONS:MGVFS}
USE_GNOME+=		gvfs
.else
LIB_DEPENDS+=		libcurl.so:ftp/curl
CONFIGURE_ARGS+=	--without-gvfs
.endif

CONFIGURE_ARGS+=	--without-webkit

.if ${PORT_OPTIONS:MJASPER}
LIB_DEPENDS+=		libjasper.so:graphics/jasper
CONFIGURE_ARGS+=	--with-libjasper
PLIST_SUB+=		JASPER=""
.else
CONFIGURE_ARGS+=		--without-libjasper
PLIST_SUB+=		JASPER="@comment "
.endif

.if ${PORT_OPTIONS:MLIBEXIF}
LIB_DEPENDS+=		libexif.so:graphics/libexif
PLIST_SUB+=		EXIF=""
.else
CONFIGURE_ARGS+=	--without-libexif
PLIST_SUB+=		EXIF="@comment "
.endif

.if ${PORT_OPTIONS:MLIBMNG}
LIB_DEPENDS+=		libmng.so:graphics/libmng
PLIST_SUB+=		MNG=""
.else
CONFIGURE_ARGS+=	--without-libmng
PLIST_SUB+=		MNG="@comment "
.endif

.if ${PORT_OPTIONS:MLIBRSVG2}
USE_GNOME+=		librsvg2
CONFIGURE_ARGS+=	--with-librsvg
PLIST_SUB+=		SVG=""
.else
CONFIGURE_ARGS+=	--without-librsvg
PLIST_SUB+=		SVG="@comment "
.endif

.if ${PORT_OPTIONS:MPOPPLER}
LIB_DEPENDS+=		libpoppler-glib.so:graphics/poppler-glib
PLIST_SUB+=		POPPLER=""
.else
CONFIGURE_ARGS+=	--without-poppler
PLIST_SUB+=		POPPLER="@comment "
.endif

.if !${PORT_OPTIONS:MSIMD}
CONFIGURE_ARGS+=	--disable-mmx \
			--disable-sse \
			--disable-altivec
.endif

.if ${PORT_OPTIONS:MWMF}
LIB_DEPENDS+=		libwmf.so:graphics/libwmf
PLIST_SUB+=		WMF=""
.else
CONFIGURE_ARGS+=	--without-wmf
PLIST_SUB+=		WMF="@comment "
.endif

.endif

LIB_DEPENDS+=	libexecinfo.so:devel/libexecinfo
LIBS+=-lexecinfo

post-patch:
	@${REINPLACE_CMD} -e 's|%%GIMP_LIBS%%|${GIMP_LIBS}|; \
		s|%%GIMP_THUMB_LIBS%%|${GIMP_THUMB_LIBS}|; \
		s|%%GIMP_UI_LIBS%%|${GIMP_UI_LIBS}|' \
			${WRKSRC}/plug-ins/pygimp/Makefile.in
	@${REINPLACE_CMD} -e 's/-u /-Wl,-u,/' \
		${WRKSRC}/app/Makefile.in
	@${REINPLACE_CMD} -e 's|"libpng"|"libpng15"|' \
	    	-e 's|x86_64|amd64|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
