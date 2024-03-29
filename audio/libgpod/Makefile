PORTNAME=	libgpod
PORTVERSION=	0.8.3
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	SF/gtkpod/${PORTNAME}/${PORTNAME}-${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for direct access to iPod contents

LICENSE=	lgpl

LIB_DEPENDS=	libplist-2.0.so:devel/libplist \
		libtag.so:audio/taglib \
		libsgutils2.so:sysutils/sg3_utils

USES=		compiler:c++11-lang gettext gmake gnome libtool localbase pathfix \
		pkgconfig sqlite:3 tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-silent-rules --disable-udev --without-hal \
		--without-python \
		--with-html-dir="${DOCSDIR:H}"
USE_CSTD=	gnu89
USE_GNOME=	gdkpixbuf2 gtk20 intltool libxml2
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS IMOBILE MONO
OPTIONS_DEFAULT=IMOBILE
OPTIONS_EXCLUDE?=	MONO
OPTIONS_SUB=	yes

IMOBILE_DESC=	Apple iPhone/iPod Touch support

IMOBILE_LIB_DEPENDS=	libimobiledevice-1.0.so:comms/libimobiledevice
IMOBILE_CONFIGURE_WITH=	libimobiledevice

MONO_USE=		GNOME=gtksharp20
MONO_CONFIGURE_WITH=	mono

PORTDOCS=	ChangeLog NEWS README*

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MIMOBILE}
COMMENT:=	${COMMENT:S,iPod,&/iPhone,}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|libplist >= 1\.0|libplist-2.0 >= 2.0|g' \
		${WRKSRC}/configure

post-patch-MONO-on:
	${REINPLACE_CMD} 's/gmcs/mcs/g' ${WRKSRC}/configure ${WRKSRC}/m4/mono.m4

.if ${SLAVE_PORT} == no
post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tools/ipod-time-sync \
		${PREFIX}/bin
.endif

post-install-MONO-off:
	@${RM} ${FAKE_DESTDIR}${PREFIX}/libdata/pkgconfig/libgpod-sharp.pc

post-install-DOCS-on:
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
