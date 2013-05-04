# $MidnightBSD: mports/databases/tdb/Makefile,v 1.7 2013/05/04 20:50:04 laffer1 Exp $
PORTNAME=		tdb
PORTVERSION=		1.2.11
CATEGORIES=		databases
MASTER_SITES=		${MASTER_SITE_SAMBA}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Trivial Database
LICENSE=		gpl3

CONFLICTS=		samba3[0-4]-3.*

USE_PYTHON_BUILD=	-2.7
USE_LDCONFIG=		yes
HAS_CONFIGURE=		yes
WAF_TOOL=		buildtools/bin/waf
CONFIGURE_SCRIPT=	${WAF_TOOL} configure
USE_PKGCONFIG=		yes

MAKE_JOBS_SAFE=		yes

PKGCONFIGDIR?=		${PREFIX}/libdata/pkgconfig
PLIST_SUB+=		PKGCONFIGDIR=${PKGCONFIGDIR:S;${PREFIX}/;;}

OPTIONS_DEFINE=		PYTHON
OPTIONS_DEFAULT=	PYTHON

.include <bsd.mport.options.mk>

MAN8=			tdbbackup.8 \
			tdbdump.8 \
			tdbrestore.8 \
			tdbtool.8

PLIST_FILES=		bin/tdbbackup \
			bin/tdbdump \
			bin/tdbrestore \
			bin/tdbtool \
			include/tdb.h \
			lib/libtdb.so \
			lib/libtdb.so.1 \
			%%PKGCONFIGDIR%%/tdb.pc

CONFIGURE_ENV+=		XSLTPROC="/usr/bin/true"
CONFIGURE_ENV+=		NOCOLOR=yes
MAKE_ENV+=		NOCOLOR=yes

CONFIGURE_ARGS+=	--mandir=${MANPREFIX}/man

.if !defined(DISABLE_MAKE_JOBS) && !defined(MAKE_JOBS_UNSAFE)
.if defined(MAKE_JOBS_SAFE) || defined(FORCE_MAKE_JOBS)
CONFIGURE_ARGS+=	--jobs=${MAKE_JOBS_NUMBER}
_MAKE_JOBS=		--jobs=${MAKE_JOBS_NUMBER}
.endif
.endif

.if ${PORT_OPTIONS:MPYTHON}
USE_PYTHON_RUN=		yes
PLIST_FILES+=		%%PYTHON_SITELIBDIR%%/tdb.so
PLIST_DIRSTRY+=		%%PYTHON_SITELIBDIR%% \
			%%PYTHON_LIBDIR%%
.else
CONFIGURE_ARGS+=	--disable-python
.endif

ALL_TARGET=		build
INSTALL_TARGET=		install

.include <bsd.port.pre.mk>

IGNORE_NONTHREAD_PYTHON=needs port lang/python${PYTHON_SUFFIX} to be build with THREADS support

post-patch:
			@${REINPLACE_CMD} -e 's|%%PKGCONFIGDIR%%|${PKGCONFIGDIR}|g' \
				${BUILD_WRKSRC}/wscript

# Use threading (or multiprocessing) but not thread (renamed in python 3+).
pre-configure:
			@if ! ${PYTHON_CMD} -c "import multiprocessing;" 2>/dev/null; then \
				${ECHO_CMD}; \
				${ECHO_MSG} "===>  ${PKGNAME} "${IGNORE_NONTHREAD_PYTHON:Q}.; \
				${ECHO_CMD}; \
				${FALSE}; \
			fi

pre-build:
	${MKDIR} ${BUILD_WRKSRC}/bin/default/manpages
.for man in ${MAN8}
	${INSTALL_MAN} ${FILESDIR}/${man} ${BUILD_WRKSRC}/bin/default/manpages
.endfor

do-build:
			@(cd ${BUILD_WRKSRC}; \
			if ! ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${BUILD_WRKSRC}/${WAF_TOOL} ${_MAKE_JOBS} ${MAKE_ARGS} ${ALL_TARGET}; then \
				if [ x != x${BUILD_FAIL_MESSAGE} ] ; then \
					${ECHO_MSG} "===> Compilation failed unexpectedly."; \
					(${ECHO_CMD} ${BUILD_FAIL_MESSAGE}) | ${FMT} 75 79 ; \
				fi; \
			${FALSE}; \
			fi)


PRG=	tdbbackup tdbdump tdbrestore tdbtool
LB=	libtdb.so libtdb.so.1
do-install:
.for p in ${PRG}
	@${INSTALL_PROGRAM} ${INSTALL_WRKSRC}/bin/default/${p} ${PREFIX}/bin/
.endfor
	@${INSTALL_DATA} ${INSTALL_WRKSRC}/include/tdb.h ${PREFIX}/include/
	@${INSTALL_LIB} ${INSTALL_WRKSRC}/bin/shared/libtdb.so.1 ${PREFIX}/lib/
	@cd ${PREFIX}/lib && ${LN} -sf libtdb.so.1 libtdb.so
	@${INSTALL_DATA} ${INSTALL_WRKSRC}/bin/default/tdb.pc ${PKGCONFIGDIR}/tdb.pc
.if ${PORT_OPTIONS:MPYTHON}
	${MKDIR} -p ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
	@${INSTALL_LIB} ${INSTALL_WRKSRC}/bin/python/tdb.so ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
.endif
.for man in ${MAN8}
	${INSTALL_MAN} ${FILESDIR}/${man} ${PREFIX}/man/man8
.endfor

.include <bsd.port.post.mk>
