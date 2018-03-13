# $MidnightBSD$

PORTNAME=		talloc
PORTVERSION=		2.1.11
PORTEPOCH=		0
CATEGORIES=		devel
MASTER_SITES=		SAMBA

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Hierarchical pool based memory allocator

LICENSE=		lgpl3

CONFLICTS=		samba33-3.*

USES=			compiler pkgconfig waf
USE_PYTHON_BUILD=	2
USE_LDCONFIG=		yes
WAF_CMD=		buildtools/bin/waf
CONFIGURE_LOG=		bin/config.log

PKGCONFIGDIR?=		${PREFIX}/libdata/pkgconfig
PLIST_SUB+=		PKGCONFIGDIR=${PKGCONFIGDIR:S;${PREFIX}/;;}

CONFIGURE_ARGS+=	--prefix=${FAKE_DESTDIR}${PREFIX} \
			--mandir=${FAKE_DESTDIR}${MANPREFIX}/man \
			--infodir=${FAKE_DESTDIR}${PREFIX}/${INFO_PATH}/${INFO_SUBDIR} \
			--without-gettext \
			--disable-rpath 
# Support staging
DESTDIRNAME=		--destdir

OPTIONS_DEFINE=		MANPAGES
MANPAGES_DESC=		Build and install manpages (requires textproc/docbook-xsl)

.include <bsd.mport.options.mk>

PLIST_FILES+=		include/talloc.h \
			lib/libtalloc.so \
			lib/libtalloc.so.2 \
			%%PKGCONFIGDIR%%/talloc.pc

.if defined(NO_PYTHON)
CONFIGURE_ARGS+=	--disable-python
.else
USE_PYTHON_RUN=		yes
PLIST_FILES+=		include/pytalloc.h \
			lib/libpytalloc-util.so \
			lib/libpytalloc-util.so.2 \
			%%PYTHON_SITELIBDIR%%/talloc.so \
			%%PKGCONFIGDIR%%/pytalloc-util.pc
# XXX: This is a gross hack to make port use both Python 2.7+ and 3.3+
# This is not officially supported, use at your own risk
.if defined(WITH_SAMBA4_PYTHON3) && ${WITH_SAMBA4_PYTHON3:Mpython3\.[0-9]}
SAMBA4_PYTHON3=		${WITH_SAMBA4_PYTHON3}
SAMBA4_PYTHON3_VERSION:=${SAMBA4_PYTHON3:S/^python//}
SAMBA4_PYTHON3_VER:=	${SAMBA4_PYTHON3_VERSION:C/\.//}
.if !exists(${PORTSDIR}/lang/python${SAMBA4_PYTHON3_VER})
.error			unsupported or unknown Python version ${SAMBA4_PYTHON3_VERSION}
.endif
BUILD_DEPENDS+=		${SAMBA4_PYTHON3}:lang/python${SAMBA4_PYTHON3_VER}
RUN_DEPENDS+=		${SAMBA4_PYTHON3}:lang/python${SAMBA4_PYTHON3_VER}
# cpython-36m
SAMBA4_PYTHON3_SO_ABI!=	[ ! -f "${LOCALBASE}/bin/${SAMBA4_PYTHON3}" ] || ${LOCALBASE}/bin/${SAMBA4_PYTHON3} -c 'import sysconfig; print(sysconfig.get_config_var("SOABI") or "")' 2>/dev/null
SAMBA4_PYTHON3_SITELIBDIR=lib/python${SAMBA4_PYTHON3_VERSION}/site-packages

CONFIGURE_ENV+=		PYTHON3_SO_ABI_FLAG=.${SAMBA4_PYTHON3_SO_ABI}
CONFIGURE_ARGS+=	--extra-python=${LOCALBASE}/bin/${SAMBA4_PYTHON3}

PLIST_SUB+=		SAMBA4_PYTHON3_SO_ABI=${SAMBA4_PYTHON3_SO_ABI} \
			SAMBA4_PYTHON3_SITELIBDIR=${SAMBA4_PYTHON3_SITELIBDIR}

PLIST_FILES+=		lib/libpytalloc-util.%%SAMBA4_PYTHON3_SO_ABI%%.so \
			lib/libpytalloc-util.%%SAMBA4_PYTHON3_SO_ABI%%.so.2 \
			%%SAMBA4_PYTHON3_SITELIBDIR%%/talloc.%%SAMBA4_PYTHON3_SO_ABI%%.so \
			%%PKGCONFIGDIR%%/pytalloc-util.%%SAMBA4_PYTHON3_SO_ABI%%.pc
.endif
.endif

# https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=219455
.if ${ARCH} == powerpc64 || ${ARCH} == powerpc
.info EXTRA_PATCHES+=		${FILESDIR}/powerpc-patch-lib_replace_wscript
.endif

.include <bsd.port.pre.mk>

.if ! ${PORT_OPTIONS:MMANPAGES}
CONFIGURE_ENV+=		XSLTPROC="true"
.else
BUILD_DEPENDS+=		${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:textproc/docbook-xsl \
			xsltproc:textproc/libxslt
.endif
# No fancy color error messages
.if ${COMPILER_TYPE} == "clang"
CFLAGS+=		-fno-color-diagnostics
.endif
CONFIGURE_ENV+=		NOCOLOR=yes
MAKE_ENV+=		NOCOLOR=yes

TALLOC_MAN3=		man/man3/talloc.3.gz

#PLIST_FILES+=		${TALLOC_MAN3}

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
			-${MKDIR} ${BUILD_WRKSRC}/bin/default/man
.for man in ${TALLOC_MAN3}
			${INSTALL_MAN} ${FILESDIR}/`basename ${man} .gz` ${BUILD_WRKSRC}/bin/default/man
.endfor

post-install:
			${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libtalloc.so
.if !defined(NO_PYTHON)
			${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libpytalloc-util.so
			${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/talloc.so
.if defined(SAMBA4_PYTHON3)
			${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libpytalloc-util.${SAMBA4_PYTHON3_SO_ABI}.so
			${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SAMBA4_PYTHON3_SITELIBDIR}/talloc.${SAMBA4_PYTHON3_SO_ABI}.so
.endif
.endif

.include <bsd.port.post.mk>
