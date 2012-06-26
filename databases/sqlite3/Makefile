# $MidnightBSD: mports/databases/sqlite3/Makefile,v 1.17 2012/02/24 00:49:01 laffer1 Exp $

PORTNAME=	sqlite
PORTVERSION=	3.7.12.1
CATEGORIES=	databases lang tcl
MASTER_SITES=	http://www.sqlite.org/ \
		http://www2.sqlite.org/ \
		http://www3.sqlite.org/
DISTNAME=	sqlite-autoconf-3071201

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An SQL database engine in a C library w/ Tcl wrapper
LICENSE=	publicdom

USE_GMAKE=	YES
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	YES
GNU_CONFIGURE=	YES
USE_GNOME=	gnomehack pkgconfig
USE_TCL_BUILD=	84+
CONFIGURE_ARGS=		--prefix=${PREFIX}
CONFIGURE_ENV+=		TCLSH_CMD="${TCLSH}" \
			TCLLIBDIR=${PREFIX}/lib/${PORTNAME} \
			ac_cv_search_pthread_create=""
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd7.0

MAN1=		sqlite3.1

OPTIONS=	DEBUG		"Enable debugging & verbose explain"	off \
		FTS3		"Enable FTS3 (Full Text Search) module"	off \
		RTREE		"Enable R*Tree module"			off \
		RAMTABLE	"Store temporary tables in RAM"		off \
		TCLWRAPPER	"Enable TCL wrapper"			off \
		METADATA	"Enable column metadata"		on \
		THREADSAFE	"Build thread-safe library"		on \
		EXTENSION	"Allow loadable extensions"		on

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_FTS3)
CFLAGS+=		-DSQLITE_ENABLE_FTS3=1
.endif

.if defined(WITH_RTREE)
CFLAGS+=		-DSQLITE_ENABLE_RTREE=1
.endif

.if defined(WITH_RAMTABLE)
CONFIGURE_ARGS+=	--enable-tempstore=yes
.endif

.if defined(WITH_TCLWRAPPER)
CATEGORIES+=		lang tcl
COMMENT+=		with TCL Wrapper
USE_TCL_RUN=		84+
CONFIGURE_ARGS+=	--with-tcl=${TCL_LIBDIR}
PLIST_SUB+=		WITH_TCLWRAPPER=""
ALL_TARGET=		all tclsqlite3
INSTALL_TARGET=		install tcl_install
.else
CONFIGURE_ARGS+=	--disable-tcl
PLIST_SUB+=		WITH_TCLWRAPPER="@comment "
.endif

.if !defined(WITHOUT_METADATA)
CFLAGS+=		-DSQLITE_ENABLE_COLUMN_METADATA=1
.endif

.if !defined(WITHOUT_THREADSAFE)
CONFIGURE_ARGS+=	--enable-threadsafe \
			--enable-threads-override-locks
.else
CONFIGURE_ARGS+=	--disable-threadsafe
.endif

.if !defined(WITHOUT_EXTENSION)
CONFIGURE_ARGS+=	--enable-load-extension
.else
CONFIGURE_ARGS+=	--disable-load-extension
.endif

post-install:
.if defined(WITH_TCLWRAPPER)
	@${INSTALL_PROGRAM} ${WRKSRC}/.libs/tclsqlite3 ${PREFIX}/bin
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${FILESDIR}/example.tcl ${EXAMPLESDIR}
.endif
.if !defined(NO_INSTALL_MANPAGES)
	@${INSTALL_MAN} ${WRKSRC}/sqlite3.1 ${MANPREFIX}/man/man1
.endif

.include <bsd.port.post.mk>
