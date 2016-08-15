# $MidnightBSD$

PORTNAME=	tk
PORTVERSION=	8.4.19
PORTREVISION=	1
PORTEPOCH=	2
CATEGORIES=	x11-toolkits tk
MASTER_SITES=	SF/tcl/Tcl/${PORTVERSION}
DISTNAME=	${PORTNAME}${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical toolkit for Tcl
LICENSE=	other

ALL_TARGET=	all
INSTALL_TARGET=	install

OPTIONS=	TKMAN 	"Install TK man pages" on \
		THREADS "Enable threads" on

USE_LDCONFIG=	yes
USE_TCL=	${SHORT_TK_VER}
USE_XORG=	x11
CFLAGS+=	-I${TCL_INCLUDEDIR}/generic
WRKSRC=		${WRKDIR}/${PORTNAME}${PORTVERSION}/unix
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared \
		--enable-man-suffix=.${MAN_SUFFIX} \
		--with-tcl=${TCL_LIBDIR} \
		--includedir=${PREFIX}/include/tk${TK_VER}

CONFIGURE_ENV=	PORTSDIR=${PORTSDIR} TK_LIB_FILE=libtk${SHORT_TK_VER}.so.1

CFLAGS+=	-I${TCL_INCLUDEDIR}

TK_VER=		${PORTVERSION:R}
SHORT_TK_VER=	${TK_VER:S/.//}
LATEST_LINK=	${PORTNAME}${SHORT_TK_VER}
MAN_SUFFIX=	${LATEST_LINK}

MAKE_ENV=	SHORT_TK_VER=${SHORT_TK_VER}

PLIST_SUB=	TK_VER=${TK_VER} \
		SHORT_TK_VER=${SHORT_TK_VER}

SUB_FILES=	pkgIndex.tcl

.include <bsd.mport.options.mk>

.if defined(WITH_TKMAN) && !defined(NO_INSTALL_MANPAGES)
INSTALL_TARGET+=install-doc
.include "${.CURDIR}/Makefile.man"
.endif

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threads
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

post-patch:
	@(cd ${WRKSRC}/..; ${PATCH} -p0 < ${PATCHDIR}/extra-lastevent-patch)
	@${REINPLACE_CMD} -e 's|X11/Intrinsic.h|X11/Xlib.h|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|@TK_SHARED_BUILD@|#@TK_SHARED_BUILD@|g' ${WRKSRC}/Makefile.in

post-configure:
	${REINPLACE_CMD} -e 's|${WRKDIRPREFIX}${.CURDIR}|$${WRKDIRPREFIX}${TKBASE}|' \
		${WRKSRC}/tkConfig.sh

post-install:
	${INSTALL_DATA} ${WRKDIR}/pkgIndex.tcl ${PREFIX}/lib/tk${TK_VER}/

regression-test:	build
	cd ${WRKSRC}; ${MAKE} test
	${ECHO_CMD} "package require Tk" | tclsh${TK_VER}
	${ECHO_CMD} "load libtk${SHORT_TK_VER}.so" | tclsh${TK_VER}

.include <bsd.port.mk>
