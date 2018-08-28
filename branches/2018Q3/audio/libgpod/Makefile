# $MidnightBSD$

PORTNAME=	libgpod
PORTVERSION=	0.8.3
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF/gtkpod/${PORTNAME}/${PORTNAME}-${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for direct access to iPod contents

LICENSE=	lgpl

LIB_DEPENDS=	libplist.so:${PORTSDIR}/devel/libplist \
		libtag.so:${PORTSDIR}/audio/taglib \
		libsgutils2.so:${PORTSDIR}/sysutils/sg3_utils

USE_GNOME=	gdkpixbuf gtk20 intltool
USE_SQLITE=	3
USES=		gettext gmake pkgconfig tar:bzip2 
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-silent-rules --disable-udev --without-hal \
		--with-html-dir="${DOCSDIR:H}"
USE_CSTD=	gnu89
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	IMOBILE MONO PYTHON
OPTIONS_DEFAULT=IMOBILE

IMOBILE_DESC=	Apple iPhone/iPod Touch support

PORTDOCS=	ChangeLog NEWS README*

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MMONO}
USE_GNOME+=	gtksharp20
CONFIGURE_ARGS+=--with-mono
PLIST_SUB+=	MONO=""
.else
CONFIGURE_ARGS+=--without-mono
PLIST_SUB+=	MONO="@comment "
.endif

.if ${PORT_OPTIONS:MPYTHON}
BUILD_DEPENDS+=	swig2.0:${PORTSDIR}/devel/swig20 \
		${PYTHON_SITELIBDIR}/mutagen/__init__.py:${PORTSDIR}/audio/py-mutagen
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/mutagen/__init__.py:${PORTSDIR}/audio/py-mutagen
USE_GNOME+=	pygobject
USE_PYTHON=	yes
PLIST_SUB+=	PYTHON=""
.else
CONFIGURE_ARGS+=--without-python
PLIST_SUB+=	PYTHON="@comment "
.endif

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MIMOBILE} && (${OSVERSION} > 4000)
COMMENT:=	${COMMENT:S,iPod,&/iPhone,}
LIB_DEPENDS+=	imobiledevice:${PORTSDIR}/comms/libimobiledevice
CONFIGURE_ENV+=	LIBUSB_CFLAGS=" " LIBUSB_LIBS="-lusb"
.else
CONFIGURE_ARGS+=--without-libimobiledevice
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,libdir)/pkgconfig,prefix)/libdata/pkgconfig,' \
		${WRKSRC}/Makefile.in \
		${WRKSRC}/bindings/mono/libgpod-sharp/Makefile.in
# Allow to build tools without HAL
	@${REINPLACE_CMD} -e '/noinst_PROGRAMS =/ s,^,@HAVE_HAL_TRUE@,' \
		${WRKSRC}/tools/Makefile.in
.if ! ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} -e 's, docs,,' \
		${WRKSRC}/Makefile.in
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
