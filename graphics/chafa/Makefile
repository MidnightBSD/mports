PORTNAME=	chafa
DISTVERSION=	1.14.4
CATEGORIES=	graphics
MASTER_SITES=	https://hpjansson.org/chafa/releases/ \
		https://github.com/hpjansson/chafa/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Character art facsimile generator
WWW=		https://hpjansson.org/chafa/

LICENSE=	gpl3 lgpl3+
LICENSE_COMB=	multi
LICENSE_FILE_gpl3=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl3+ =	${WRKSRC}/COPYING.LESSER

LIB_DEPENDS=	libavif.so:graphics/libavif \
		libfreetype.so:print/freetype2 \
		libjxl_threads.so:graphics/libjxl \
		libtiff.so:graphics/tiff \
		libwebpdemux.so:graphics/webp

USES=		cpe gettext-runtime gnome jpeg libtool magick:7 tar:xz
CPE_VENDOR=	chafa_project
USE_GNOME=	cairo gdkpixbuf glib20 librsvg2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${DOCSDIR}/html

INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/${PORTNAME}.1 \
		${STAGEDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
