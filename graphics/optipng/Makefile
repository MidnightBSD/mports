PORTNAME=	optipng
PORTVERSION=	0.7.7
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/OptiPNG/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Optimizer for PNG files
WWW=		https://optipng.sourceforge.net/

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

OPTIONS_DEFINE=	BUNDLED_LIBPNG BUNDLED_ZLIB DOCS

BUNDLED_LIBPNG_DESC=		Use bundled libpng
BUNDLED_LIBPNG_CONFIGURE_OFF=	--with-system-libpng
BUNDLED_LIBPNG_CONFIGURE_ON=	--without-system-libpng
BUNDLED_LIBPNG_LIB_DEPENDS_OFF=	libpng.so:graphics/png
BUNDLED_LIBPNG_USES_OFF=	localbase:ldflags

BUNDLED_ZLIB_DESC=		Use bundled zlib
BUNDLED_ZLIB_CONFIGURE_OFF=	--with-system-zlib
BUNDLED_ZLIB_CONFIGURE_ON=	--without-system-zlib

USES=	gmake
HAS_CONFIGURE=	yes

PLIST_FILES=	bin/optipng share/man/man1/optipng.1.gz
PORTDOCS=	history.txt optipng.man.html optipng.man.pdf optipng.man.txt \
		png_optimization.html todo.txt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/optipng/optipng ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/src/optipng/man/optipng.1 ${STAGEDIR}${PREFIX}/share/man/man1/

	${INSTALL} -d ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/doc/,} ${STAGEDIR}${DOCSDIR}/

.include <bsd.port.mk>
