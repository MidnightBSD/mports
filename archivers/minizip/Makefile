PORTNAME=	minizip
PORTVERSION=	1.3.1
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/madler/zlib/releases/download/v${DISTVERSION}/
DISTNAME=	zlib-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Zip library and programs from Zlib distribution
WWW=		https://www.winimage.com/zLibDll/minizip.html

LICENSE=	zlib

USES=		autoreconf cpe libtool pathfix tar:xz
CPE_VENDOR=	minizip_project
USE_LDCONFIG=	yes
PATHFIX_MAKEFILEIN=	Makefile.am
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-demos
INSTALL_TARGET=	install-strip
WRKSRC=		${WRKDIR}/zlib-${PORTVERSION}/contrib/minizip

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} 's/#ifdef unix || __APPLE__/#ifdef unix/' ${WRKSRC}/mini???.c

post-install:
	${INSTALL_MAN} ${WRKSRC}/*.1 ${STAGEDIR}${PREFIX}/share/man/man1

regression-test:
	${RM} -rf ${WRKDIR}/regression-test1
	${MKDIR} ${WRKDIR}/regression-test1
	${MV} ${WRKSRC}/*.[cho] ${WRKDIR}/regression-test1
	${RM} -f ${WRKDIR}/test.zip
	(cd ${WRKDIR}/regression-test1 && ${WRKSRC}/minizip ${WRKDIR}/test.zip *)
	${RM} -rf ${WRKDIR}/regression-test2
	${MKDIR} ${WRKDIR}/regression-test2
	${WRKSRC}/miniunzip ${WRKDIR}/test.zip -d ${WRKDIR}/regression-test2
	${DIFF} -ur ${WRKDIR}/regression-test1 ${WRKDIR}/regression-test2 > /dev/null

.include <bsd.port.mk>
