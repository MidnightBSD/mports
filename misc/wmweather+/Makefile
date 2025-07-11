PORTNAME=	wmweather+
PORTVERSION=	2.18
CATEGORIES=	misc windowmaker geography
MASTER_SITES=	SF/wmweatherplus/wmweather%2B/ \
		SF/nemysisfreebsdp/misc/:icons
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX} \
		${PORTNAME}.png:icons
EXTRACT_ONLY=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Displays current conditions and forecasts with icons and text
WWW=		https://sourceforge.net/projects/wmweatherplus/

LICENSE=	gpl2+	
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libpcre.so:devel/pcre \
		libtiff.so:graphics/tiff \
		libHermes.so:graphics/Hermes \
		libpng.so:graphics/png \
		libgif.so:graphics/giflib \
		libwraster.so:x11-wm/libwraster

USES=		iconv jpeg xorg
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libwraster=${LOCALBASE} \
		--with-libpcre=${LOCALBASE} \
		--with-libcurl=${LOCALBASE} \
		--with-xpm-includes=${LOCALBASE} \
		--with-xpm-libraries=${LOCALBASE}
USE_XORG=	x11 xext xpm sm ice
LDFLAGS+=	-lm

WRKSRC=		${WRKDIR}/wmweather+-${PORTVERSION}

SUB_FILES=	pkg-message

PLIST_FILES=	bin/${PORTNAME} \
		share/man/man1/${PORTNAME}.1.gz \
		share/pixmaps/${PORTNAME}.png

PORTDOCS=	ChangeLog README
PORTEXAMPLES=	HINTS example.conf

DESKTOP_ENTRIES="${PORTNAME}" "" "${PORTNAME}" \
		"${PORTNAME}" "System;Monitor;" ""

OPTIONS_DEFINE=	DOCS EXAMPLES WM
WM_DESC=	Depend on Window Maker port (otherwise only libwraster)

WM_LIB_DEPENDS=		libWMaker.so:x11-wm/windowmaker

post-patch:
	@${REINPLACE_CMD} \
		-e 's| __THROW __attribute__ ((__noreturn__))||' \
		-e 's|http://www.nws.noaa.gov/tg/siteloc.shtml|http://www.nws.noaa.gov/tg/siteloc.php|' \
		-e 's|"/etc/wmweather+.conf"|"${PREFIX}/etc/wmweather+.conf"|' \
		${WRKSRC}/${PORTNAME}.c
	@${REINPLACE_CMD} \
		-e 's|http://www.nws.noaa.gov/tg/siteloc.shtml|http://www.nws.noaa.gov/tg/siteloc.php|' \
		-e 's|/etc/wmweather+.conf|${PREFIX}/etc/wmweather+.conf|' \
		${WRKSRC}/${PORTNAME}.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 \
		${STAGEDIR}${PREFIX}/share/man/man1/
	${INSTALL_DATA} ${_DISTDIR}/${PORTNAME}.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${PORTEXAMPLES:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
