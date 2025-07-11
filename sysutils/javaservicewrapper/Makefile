PORTNAME=	javaservicewrapper
PORTVERSION=	3.5.60
CATEGORIES=	sysutils java
MASTER_SITES=	https://wrapper.tanukisoftware.com/download/${PORTVERSION}/
DISTNAME=	wrapper_${PORTVERSION}_src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSW enables a Java application to be run as a Unix daemon
WWW=		https://wrapper.tanukisoftware.org/

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

USES=		gmake iconv java:ant,run
USE_LDCONFIG=	${PREFIX}/lib/javaservicewrapper/lib

DATADIR=	${PREFIX}/lib/${PORTNAME}

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

.include <bsd.mport.options.mk>

.if (${ARCH} == amd64)
MAKE_ARGS+=	-Dbits=64
.else
MAKE_ARGS+=	-Dbits=32
CFLAGS+=	-fPIC
.endif

.include <bsd.port.pre.mk>

.if ${JAVA_PORT_VERSION} >= 15
PLIST_SUB+=	JS_ENGINE="@comment "
.else
PLIST_SUB+=	JS_ENGINE=""
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|gcc|${CC} ${CFLAGS}| ; \
			s|/usr/local|${ICONV_PREFIX}|g ; \
			s|-liconv|${ICONV_LIB}|' \
		${WRKSRC}/src/c/Makefile-freebsd-x86-32.gmake \
		${WRKSRC}/src/c/Makefile-freebsd-x86-64.gmake
	@${REINPLACE_CMD} -e 's|\(javac\.target\.version\)=.*|\1=1.8|' \
		${WRKSRC}/default.properties
	${CP} ${WRKSRC}/src/c/Makefile-freebsd-x86-32.gmake ${WRKSRC}/src/c/Makefile-midnightbsd-x86-32.gmake
	${CP} ${WRKSRC}/src/c/Makefile-freebsd-x86-64.gmake ${WRKSRC}/src/c/Makefile-midnightbsd-x86-64.gmake

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	cd ${WRKSRC} && ${CP} -rp bin conf lib test ${STAGEDIR}${DATADIR}
	${STRIP_CMD} ${STAGEDIR}${DATADIR}/bin/wrapper
	cd ${PREFIX} && ${LN} -sf ../${DATADIR_REL}/bin/wrapper bin/${PORTNAME}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/* ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
