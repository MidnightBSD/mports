PORTNAME=	libgpod
PORTVERSION=	0.8.3
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	SF/gtkpod/${PORTNAME}/${PORTNAME}-${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for direct access to iPod contents

LICENSE=	lgpl

LIB_DEPENDS=	libplist.so:devel/libplist \
		libtag.so:audio/taglib \
		libsgutils2.so:sysutils/sg3_utils

USE_GNOME=	gdkpixbuf gtk20 intltool libxml2
USE_SQLITE=	3
USES=		compiler:c++11-lang gettext gmake pkgconfig tar:bzip2 
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-silent-rules --disable-udev --without-hal \
		--with-html-dir="${DOCSDIR:H}"
USE_CSTD=	gnu89
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	IMOBILE MONO PYTHON
OPTIONS_DEFAULT=IMOBILE
OPTIONS_EXCLUDE?=	MONO
OPTIONS_SUB=	yes

IMOBILE_DESC=	Apple iPhone/iPod Touch support

PORTDOCS=	ChangeLog NEWS README*

IMOBILE_LIB_DEPENDS=	libimobiledevice.so:comms/libimobiledevice
IMOBILE_CONFIGURE_WITH=	libimobiledevice

MONO_USE=		GNOME=gtksharp20
MONO_CONFIGURE_WITH=	mono

PYTHON_BUILD_DEPENDS=	swig3.0:devel/swig30 \
			${PYTHON_PKGNAMEPREFIX}mutagen>0:audio/py-mutagen@${PY_FLAVOR}
PYTHON_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mutagen>0:audio/py-mutagen@${PY_FLAVOR}
PYTHON_USE=		GNOME=pygobject
PYTHON_USES=		python:2.7
PYTHON_CONFIGURE_ENV=	SWIG="${LOCALBASE}/bin/swig3.0"
PYTHON_CONFIGURE_WITH=	python

.include <bsd.mport.options.mk>

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

.include <bsd.port.mk>
