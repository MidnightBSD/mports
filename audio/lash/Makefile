PORTNAME=	lash
PORTVERSION=	0.5.4
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	SAVANNAH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session management system for JACK audio applications
WWW=		https://www.nongnu.org/lash/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

LIB_DEPENDS=	libjack.so:audio/jack \
		libdssialsacompat.so:audio/libdssialsacompat \
		libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig \
		libuuid.so:misc/e2fsprogs-libuuid

OPTIONS_DEFINE=	READLINE DOCS
OPTIONS_DEFAULT=READLINE

USES=		gmake gnome pathfix pkgconfig libtool
USE_GNOME=	gtk20 libxml2 gdkpixbuf cairo
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-alsa-midi
USE_LDCONFIG=	yes
LIBS=		-luuid
INSTALL_TARGET=	install-strip

CPPFLAGS+=	-I${LOCALBASE}/include/dssi -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -pthread

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MREADLINE}
USES+=		readline
PLIST_SUB+=	READLINE=""
.else
CONFIGURE_ENV+=	vl_cv_lib_readline=no
PLIST_SUB+=	READLINE="@comment "
.endif

.if ${PORT_OPTIONS:MDOCS}
BUILD_DEPENDS+=	texi2html:textproc/texi2html
.else
CONFIGURE_ENV+=	ac_cv_prog_lash_texi2html=no
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		'/if test/s|==|=|' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		'/texi2html/s|--number||' ${WRKSRC}/docs/Makefile.in

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/docs/lash-manual-html-one-page \
		&& ${INSTALL_DATA} lash-manual.html ${DOCSDIR}
.endif

.include <bsd.port.mk>
