# $MidnightBSD$

PORTNAME=	minizip
PORTVERSION=	1.2.8
PORTREVISION=	2
CATEGORIES=	archivers
MASTER_SITES=	SF/libpng/zlib/${PORTVERSION}
DISTNAME=	zlib-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Zip library and programs from Zlib distribution

LICENSE=	zlib

USES=		autoreconf libtool pathfix tar:xz
USE_AUTOTOOLS=	libtoolize
PATHFIX_MAKEFILEIN=	Makefile.am
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-demos
INSTALL_TARGET=	install-strip
WRKSRC=		${WRKDIR}/zlib-${PORTVERSION}/contrib/minizip

.include <bsd.mport.options.mk>

.if ${OSVERSION} < 4015
CPPFLAGS+=	-Dz_crc_t=uint32_t
.endif

post-patch:
	@${REINPLACE_CMD} 's/#ifdef unix || __APPLE__/#ifdef unix/' ${WRKSRC}/mini???.c

post-install:
	${INSTALL_MAN} ${WRKSRC}/*.1 ${STAGEDIR}${PREFIX}/man/man1

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
