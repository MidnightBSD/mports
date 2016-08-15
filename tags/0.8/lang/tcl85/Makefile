# $MidnightBSD$

PORTNAME=	tcl
PORTVERSION=	8.5.13
CATEGORIES=	lang tcl
MASTER_SITES=	SF/tcl/Tcl/${PORTVERSION}
PKGNAMESUFFIX=	85
DISTNAME=	tcl${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool Command Language

LICENSE=	other

OPTIONS=        TCLMAN "Install tcl 8.5 manpages" off \
		TZDATA "Install tcl timezone data" off \
		MODULES "TCL common Modules" on \
		THREADS "TCL Threads support" on

WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}/unix
ALL_TARGET=	all
INSTALL_TARGET=	install install-libraries

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared \
		--enable-man-suffix=.${MAN_SUFFIX} \
		--includedir=${PREFIX}/include/tcl${TCL_VER}
CONFIGURE_ENV=	PORTSDIR=${PORTSDIR}

TCL_VER=	8.5
SHORT_TCL_VER=	${TCL_VER:S/8./8/}
LATEST_LINK=	${PORTNAME}${SHORT_TCL_VER}
MAN_SUFFIX=	${LATEST_LINK}

MAKE_ENV=	SHORT_TCL_VER=${SHORT_TCL_VER} \
		MAN_SUFFIX=.${MAN_SUFFIX} \
		LANG=C LC_ALL=C	# LANG=C is required for some of UTF-using tests

PLIST_SUB=	TCL_VER=${TCL_VER} \
		SHORT_TCL_VER=${SHORT_TCL_VER}

.include <bsd.mport.options.mk>

.if defined(WITH_TCLMAN)
INSTALL_TARGET+=	install-doc
.include "${.CURDIR}/Makefile.man"
.endif

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threads
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

.if defined(WITH_TZDATA)
PLIST_SUB+=		TZDATA=""
CONFIGURE_ARGS+=	--with-tzdata
INSTALL_TARGET+=	install-tzdata
.else
PLIST_SUB+=		TZDATA="@comment "
CONFIGURE_ARGS+=	--without-tzdata
.endif

.if defined(WITH_MODULES)
INSTALL_TARGET+=install-tm
PLIST_SUB+=	MODULES=""
.else
PLIST_SUB+=	MODULES="@comment "
.endif

post-configure:
	@${REINPLACE_CMD} \
		-e 's,-DNO_MEMMOVE=1,,' -e 's,-DNO_STRING_H=1,,' \
		-e 's,^COMPAT_OBJS.*,,' ${WRKSRC}/Makefile

post-fake:
	@${REINPLACE_CMD} \
		-e 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}${TRUE_PREFIX}/lib/tcl8.5/tm.tcl

regression-test:	build
	cd ${WRKSRC} && LC_ALL=C ${MAKE} test

.include <bsd.port.mk>
