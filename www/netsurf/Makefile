PORTNAME=	netsurf
PORTVERSION=	3.11
CATEGORIES=	www
MASTER_SITES=	http://download.netsurf-browser.org/netsurf/releases/source/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight web browser
WWW=		https://www.netsurf-browser.org/

LICENSE=	gpl2 mit
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN=		failed to load "frontends/gtk/res/netsurf.xpm": Couldn?t recognize the image file format for file ?frontends/gtk/res/netsurf.xpm?

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	duk:lang/duktape \
		nsgenbind:devel/nsgenbind \
		p5-HTML-Parser>=3.72:www/p5-HTML-Parser \
		xxd:sysutils/xxd
LIB_DEPENDS=	libcss.so:textproc/libcss \
		libcurl.so:ftp/curl \
		libdom.so:www/libdom \
		libexpat.so:textproc/expat2 \
		libhubbub.so:www/libhubbub \
		libnsbmp.so:graphics/libnsbmp \
		libnsgif.so:graphics/libnsgif \
		libnspsl.so:dns/libnspsl \
		libnsutils.so:devel/libnsutils \
		libparserutils.so:devel/libparserutils \
		libpng.so:graphics/png \
		libutf8proc.so:textproc/utf8proc \
		libwapcaplet.so:textproc/libwapcaplet \
		libwebp.so:graphics/webp
RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss \
		duk:lang/duktape

USES=		bison cpe desktop-file-utils gmake gnome iconv:translit jpeg \
		localbase pkgconfig shebangfix ssl
CPE_VENDOR=	${PORTNAME}-browser
USE_GNOME=	cairo glib20 gtk30 librsvg2

MAKE_ARGS=	CC="${CC}" \
		CCOPT="" \
		HOST="${OPSYS}" \
		HOST_CC="${CC}" \
		OPTCFLAGS="${CFLAGS}" \
		Q="" \
		TARGET="gtk3" \
		WARNFLAGS=""
.if defined(WITH_DEBUG)
MAKE_ARGS+=	STRIP="true"
.endif
MAKE_ENV+=	COMPONENT_TYPE="lib-shared" \
		FLEX="${LOCALBASE}/bin/flex"

ALL_TARGET=	#empty
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB} -lssl -lcrypto
WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}

post-patch:
	@${REINPLACE_CMD} '/CFLAGS/d' \
		${WRKSRC}//Makefile.defaults
	@${CP} ${FILESDIR}/buildui.pl ${WRKSRC}/utils/

do-configure:
	@${CP} ${FILESDIR}/Makefile.config  ${WRKSRC}

post-install:
	cd ${STAGEDIR}${PREFIX}/bin && ${LN} -sf netsurf-gtk3 \
		netsurf-gtk
.for d in applications pixmaps
	${MKDIR} ${STAGEDIR}${PREFIX}/share/${d}
.endfor
	${INSTALL_DATA} ${WRKSRC}/frontends/gtk/res/netsurf-gtk.desktop \
		${STAGEDIR}${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/frontends/gtk/res/netsurf.xpm \
		${STAGEDIR}${PREFIX}/share/pixmaps

.include <bsd.port.mk>
