PORTNAME=	lzo2
PORTVERSION=	2.10
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/ \
		FREEBSD_LOCAL/mandree
DISTNAME=	lzo-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable speedy, lossless data compression library

LICENSE=	gpl2

USES=		libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared --docdir=${DOCSDIR} --with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS EXAMPLES

DOCS_INSTALL_TARGET_OFF=	install-exec install-pkgincludeHEADERS

post-build:
.if !defined(WITHOUT_CHECKS)
	@${ECHO_MSG} "===>  Running self-tests for ${PKGNAME} (can take a few minutes)"
	@#: override MALLOC_OPTIONS, else tests take excessively long
	cd ${WRKSRC} && ${SETENV} MALLOC_OPTIONS=jz ${MAKE} check test SHELL="${SH} -x"
.endif

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/liblzo2.so.2
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${REINPLACE_CMD} -e 's,doc/,,' NEWS README
.for i in AUTHORS BUGS COPYING NEWS README THANKS
	${INSTALL_DATA} ${WRKSRC}/${i} ${STAGEDIR}${DOCSDIR}/
.endfor
	${INSTALL_DATA}	${WRKSRC}/doc/* ${STAGEDIR}${DOCSDIR}/
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA}	${WRKSRC}/examples/[a-z]*.[ch] ${STAGEDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
