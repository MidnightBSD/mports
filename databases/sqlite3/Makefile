# $MidnightBSD: mports/databases/sqlite3/Makefile,v 1.11 2010/03/12 13:05:01 laffer1 Exp $

PORTNAME=	sqlite
PORTVERSION=	3.6.15
CATEGORIES=	databases lang tcl
MASTER_SITES=	http://www.sqlite.org/
.if defined(USE_THOL)
PKGNAMESUFFIX=  -threads
.endif
DISTNAME=       sqlite-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An SQL database engine in a C library w/ Tcl wrapper
LICENSE=	publicdom

SLAVEDIRS=      databases/sqlite3-threads

USE_GMAKE=	YES
USE_GNOME=	pkgconfig
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	YES
GNU_CONFIGURE=	YES
CONFIGURE_ARGS=		--prefix=${PREFIX} --with-hints=freebsd.hints
CONFIGURE_ENV+=		TCLLIBDIR=${PREFIX}/lib/${PORTNAME}
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1

OPTIONS=	DEBUG		"Enable debugging & verbose explain"	off \
		FTS3            "Enable FTS3 (Full Text Search) module" off \
		RAMTABLE	"Store temporary tables in RAM"		off \
		TCLWRAPPER	"TCL wrapper for SQLITE"		off \
		METADATA	"Enable column metadata"		on

.if !defined(USE_THOL)
OPTIONS+=	THREADS		"Enable threads support"		off
PLIST_SUB+=	THOL="@comment "
CONFLICTS=	sqlite-threads-3*
CONFIGURE_ARGS+=	--disable-threadsafe
.else
CONFIGURE_ARGS+=	--enable-threadsafe --enable-threads-override-locks \
			--enable-cross-thread-connections
PLIST_SUB+=	THOL=""
CONFLICTS=	sqlite-3*
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_FTS3)
CFLAGS+=		-DSQLITE_CORE=1 -DSQLITE_ENABLE_FTS3=1
EXTRA_PATCHES+=		${FILESDIR}/fts3_patch-Makefile.in
.endif

.if defined(WITH_RAMTABLE)
CONFIGURE_ARGS+=        --enable-tempstore=yes
.endif

.if defined(WITH_TCLWRAPPER)
TCL_V?=			8.4
MAKE_ARGS+=		TCLSH=tclsh${TCL_V}
MAKE_ENV+=		TCL_VER=${TCL_V}
LIB_DEPENDS+=		tcl${TCL_V:S/.//}:${PORTSDIR}/lang/tcl${TCL_V:S/.//}
CONFIGURE_ARGS+=	--with-tcl=${LOCALBASE}/lib/tcl${TCL_V}
PLIST_SUB+=		WITH_TCLWRAPPER=""
.else
CONFIGURE_ARGS+=	--disable-tcl
PLIST_SUB+=		WITH_TCLWRAPPER="@comment "
.endif

.if !defined(WITHOUT_METADATA)
CFLAGS+=		-DSQLITE_ENABLE_COLUMN_METADATA=1
.endif

post-extract:
	@${FIND} ${WRKSRC} -type d -name 'CVS' | ${XARGS} rm -r

post-patch:
	@${REINPLACE_CMD} -E -e "s|^(TLIBS.*)|\1 -lm|g" \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e "s|tclsh \$$(TOP)|\$$(TCLSH) \$$(TOP)|g" \
		-e "s|./libtool|${LIBTOOL}|g" \
		-e "s|--mode=link|--mode=link --tag=CC|g" \
		-e "s|\$${HAVE_TCL:1=tcl_install}||" \
			${WRKSRC}/Makefile.in
	@${ECHO} "config_TARGET_TCL_INC=\"-I${PREFIX}/include/tcl${TCL_V}\"" \
		> ${WRKSRC}/freebsd.hints
	@${ECHO} "config_TARGET_TCL_LIBS=\"-L${PREFIX}/lib -ltcl${TCL_V:S/.//}\"" \
		>> ${WRKSRC}/freebsd.hints
	${REINPLACE_CMD} -e "slfts3.cllg" \
		-e "slfts3_expr.cllg" ${WRKSRC}/tool/mksqlite3c.tcl

pre-configure:
.if defined(WITH_THREADS) || defined(USE_THOL)
	@${REINPLACE_CMD} -e "s|-lpthread|${PTHREAD_LIBS}|g" \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -E -e "s|(Libs:.*)|\1 ${PTHREAD_LIBS}|" \
		-e "s|(Cflags:.*)|\1 ${PTHREAD_CFLAGS}|" \
		${WRKSRC}/sqlite.pc.in ${WRKSRC}/sqlite3.pc.in
.endif

post-install:
.if defined(WITH_TCLWRAPPER)
	@${MKDIR} ${PREFIX}/lib/sqlite
	@(cd ${WRKSRC} && ${LIBTOOL} --mode=install ${INSTALL_DATA} \
		libtclsqlite3.la ${PREFIX}/lib/sqlite/)
	@${INSTALL_DATA} ${FILESDIR}/pkgIndex.tcl ${PREFIX}/lib/sqlite/
	@${INSTALL_PROGRAM} ${WRKSRC}/.libs/tclsqlite3 ${PREFIX}/bin
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${FILESDIR}/example.tcl ${EXAMPLESDIR}
.endif
.if defined(USE_THOL)
	@${MKDIR} ${DATADIR}
	@${TOUCH} ${DATADIR}/sqlite3_with_threads-override-locks
.endif

.include <bsd.port.post.mk>
