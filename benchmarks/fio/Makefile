PORTNAME=	fio
DISTVERSION=	3.38
CATEGORIES=	benchmarks
MASTER_SITES=	https://brick.kernel.dk/snaps/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flexible IO tester
WWW=		https://git.kernel.dk/cgit/fio/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gmake pkgconfig tar:bzip2

HAS_CONFIGURE=		yes
TEST_TARGET=		test
CONFIGURE_ARGS=		--disable-http \
			--disable-native \
			--disable-optimizations
MAKE_ARGS=		DEBUGFLAGS= \
			OPTFLAGS= \
			V=1
CONFLICTS_INSTALL=	py*-Fiona

OPTIONS_DEFINE=	EXAMPLES GNUPLOT LIBNFS
GNUPLOT_DESC=	Support for plotting graphs
LIBNFS_DESC=	Enable NFS support using libnfs

GNUPLOT_BUILD_DEPENDS=	${LOCALBASE}/bin/gnuplot:math/gnuplot
LIBNFS_LIB_DEPENDS=	libnfs.so:net/libnfs

LIBNFS_CONFIGURE_ENABLE=	libnfs

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/fio ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/tools/fio_generate_plots ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/fio.1 ${PREFIX}/share/man/man1/
	${INSTALL_MAN} ${WRKSRC}/tools/fio_generate_plots.1 ${PREFIX}/share/man/man1
	${MKDIR} ${PREFIX}/include/${PORTNAME}
	${MKDIR} ${PREFIX}/include/${PORTNAME}/compiler
	${MKDIR} ${PREFIX}/include/${PORTNAME}/lib
	${MKDIR} ${PREFIX}/include/${PORTNAME}/arch
	${MKDIR} ${PREFIX}/include/${PORTNAME}/os
	${MKDIR} ${PREFIX}/include/${PORTNAME}/oslib
	${INSTALL_DATA} ${WRKSRC}/compiler/compiler.h ${PREFIX}/include/${PORTNAME}/compiler
	${INSTALL_DATA} ${WRKSRC}/os/os.h ${PREFIX}/include/${PORTNAME}/os
	${INSTALL_DATA} ${WRKSRC}/os/os-freebsd.h ${PREFIX}/include/${PORTNAME}/os
	${INSTALL_DATA} ${WRKSRC}/oslib/getopt.h ${PREFIX}/include/${PORTNAME}/oslib
	${INSTALL_DATA} ${WRKSRC}/lib/*.h ${PREFIX}/include/${PORTNAME}/lib
	@(cd ${WRKSRC}/arch/ && ${COPYTREE_SHARE} . ${PREFIX}/include/${PORTNAME}/arch)
	${INSTALL_DATA} ${WRKSRC}/*.h ${PREFIX}/include/${PORTNAME}

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	@(cd ${WRKSRC}/examples && ${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
