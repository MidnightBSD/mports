# $MidnightBSD$

PORTNAME=	ming
PORTVERSION=	0.4.5
PORTREVISION?=	0
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/Releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flash 4/5 movie output library with many languages support

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2 \
		libgif.so:${PORTSDIR}/graphics/giflib \
		libpng.so:${PORTSDIR}/graphics/png

.if defined(SLAVEPORT)
LIB_DEPENDS+=	libming.so:${PORTSDIR}/graphics/ming
.else
OPTIONS_DEFINE=	DOCS
.endif

CONFIGURE_ARGS+=--includedir=${PREFIX}/include/ming
CPPFLAGS+=	-I. -I.. -I${LOCALBASE}/include
LDFLAGS+=	-L. -L.. -L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	yes
USES+=		bison gmake libtool pathfix shebangfix

DOCS=		HISTORY NEWS README TODO
DOCS_UTIL=	README TIPS TODO swftoperl.html

SHEBANG_FILES=	util/cws2fws

SLAVEDIRS=	graphics/p5-ming graphics/py-ming

post-patch:
	@${REINPLACE_CMD} -e 's|ungif|gif|g' ${WRKSRC}/configure ${WRKSRC}/docs/man/Makefile \
		${WRKSRC}/perl_ext/Makefile.PL ${WRKSRC}/py_ext/setup.py.in
	@${REINPLACE_CMD} -e '/PrintGifError();/d' ${WRKSRC}/src/blocks/gifdbl.c \
		${WRKSRC}/util/gif2dbl.c ${WRKSRC}/util/gif2mask.c
	@${REINPLACE_CMD} -e 's|#if GIFLIB_GIFERRORSTRING|#if 0|' ${WRKSRC}/src/libming.h
# patch for graphics/p5-ming
	@${REINPLACE_CMD} -e '/ming_is_compiled()/ s|^|#|; /LIBS/d' ${WRKSRC}/perl_ext/Makefile.PL
	@${REINPLACE_CMD} -e 's|\.3pm|.3|g' ${WRKSRC}/perl_ext/Makefile.PL ${WRKSRC}/perl_ext/mkdoc
	@${REINPLACE_CMD} -e 's|GvCV(\(.*\)) = \(.*\);|GvCV_set(\1, \2);|' ${WRKSRC}/perl_ext/Exports.c
	@${REINPLACE_CMD} -e '1 s|/usr/bin/perl|${PERL}|' ${WRKSRC}/perl_ext/examples/*.cgi
# patch for graphics/py-ming
	@${REINPLACE_CMD} -e 's| --root ".*"||' ${WRKSRC}/py_ext/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr/local/|${LOCALBASE}/|g' ${WRKSRC}/py_ext/setup.py.in
	@${LN} -sf ${LOCALBASE}/include/ming ${WRKSRC}/src

post-install:
.if !defined(SLAVEPORT)
	${MKDIR} ${PREFIX}/include/ming/ ${PREFIX}/include/ming/blocks/ ${PREFIX}/include/ming/util/
	cd ${WRKSRC}/ && ${INSTALL_SCRIPT} util/cws2fws util/ming-config ${PREFIX}/bin/
	cd ${WRKSRC}/ && ${INSTALL_DATA} *.h src/*.h ${PREFIX}/include/ming/
	cd ${WRKSRC}/ && ${INSTALL_DATA} src/blocks/*.h ${PREFIX}/include/ming/blocks/
	cd ${WRKSRC}/ && ${INSTALL_DATA} util/png2dbl.c util/*.h ${PREFIX}/include/ming/util/
	${MKDIR} ${STAGEDIR}${DOCSDIR}/ ${DOCSDIR}/util/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}/
	cd ${WRKSRC}/util/ && ${INSTALL_DATA} ${DOCS_UTIL} ${DOCSDIR}/util/
.endif
.if defined(SLAVEPORT) && ${SLAVEPORT} == "p5"
	${MKDIR} ${EXAMPLESDIR}/
	cd ${INSTALL_WRKSRC}/examples/ && ${INSTALL_DATA} *.cgi ${EXAMPLESDIR}/
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/SWF/SWF.so
.endif
.if defined(SLAVEPORT) && ${SLAVEPORT} == "py"
	${STRIP_CMD} ${PYTHON_SITELIBDIR}/_mingc.so
.endif

.include <bsd.port.mk>
