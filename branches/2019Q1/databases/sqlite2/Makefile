# $MidnightBSD$

PORTNAME=	sqlite
PORTVERSION=	2.8.17
CATEGORIES=	databases
MASTER_SITES=	http://www.sqlite.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SQL database engine in a C library

LICENSE=        publicdom

GNU_CONFIGURE=	yes
USES=		gmake libtool pathfix pkgconfig readline
USE_LDCONFIG=	yes

CONFIGURE_ARGS=	--with-hints=freebsd.hints
CONFIGURE_TARGET=${ARCH}-portbld-freebsd9.1

EXAMPLESDIR=	${PREFIX}/share/examples/sqlite2

EXTRACT_AFTER_ARGS=	--exclude CVS

OPTIONS_DEFINE=	TCL THREADS EXAMPLES

.if !exists(/usr/lib/libreadline.so)
MAKE_ARGS=	READLINE_FLAGS="-DHAVE_READLINE=1 -I${LOCALBASE}/include -L${LOCALBASE}/lib"
.endif

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MTCL}
USES+=		tcl
.else
.endif

.if ${PORT_OPTIONS:MTCL}
CATEGORIES+=	lang tcl
COMMENT+=	with TCL wrapper
MAKE_ARGS+=	TCLSH=${TCLSH}
MAKE_ENV+=	TCL_VER=${TCL_VER}
PLIST_SUB+=	WITH_TCLWRAPPER=""
.else
PLIST_SUB+=	WITH_TCLWRAPPER="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e "s/tclsh \$$(TOP)/\$$(TCLSH) \$$(TOP)/g" \
		${WRKSRC}/Makefile.in
.if ${PORT_OPTIONS:MTCL}
	@${ECHO} "config_TARGET_TCL_INC=\"-I${TCL_INCLUDEDIR}\"" \
		> ${WRKSRC}/freebsd.hints
	@${ECHO} "config_TARGET_TCL_LIBS=\"-L${PREFIX}/lib -ltcl${TCL_VER:S/.//}\"" \
		>> ${WRKSRC}/freebsd.hints
	${CHMOD} 755 ${WRKSRC}/www/*
.else
	@${ECHO} "" > ${WRKSRC}/freebsd.hints
.endif

post-patch-THREADS-on:
	@${ECHO} "config_TARGET_CFLAGS=\"-DTHREADSAFE=1\"" \
		>> ${WRKSRC}/freebsd.hints
	@${ECHO} "config_TARGET_LIBS=\"-lpthread\"" \
		>> ${WRKSRC}/freebsd.hints

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/sqlite
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libsqlite.so

post-install-TCL-on:
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} ${FAKE_MAKEARGS} install-tcl)
	 ${CHMOD} 755 ${WRKSRC}/www/*
	${INSTALL_DATA} ${FILESDIR}/pkgIndex.tcl ${FAKE_DESTDIR}${TRUE_PREFIX}/lib/sqlite

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${FILESDIR}/example.tcl ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
