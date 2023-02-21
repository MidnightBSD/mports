PORTNAME=			talloc
DISTVERSION=			2.3.4
PORTREVISION=			0
CATEGORIES=			devel
MASTER_SITES=			SAMBA

MAINTAINER=			ports@MidnightBSD.org
COMMENT=			Hierarchical pool based memory allocator
WWW=		https://talloc.samba.org/

LICENSE=		lgpl3

CONFLICTS_INSTALL=	talloc1-*

USES=				compiler pkgconfig shebangfix waf
USE_LDCONFIG=			yes
SHEBANG_GLOB=                 *.py
WAF_CMD=			buildtools/bin/waf
CONFIGURE_LOG=			bin/config.log

PKGCONFIGDIR?=			${PREFIX}/libdata/pkgconfig
PLIST_SUB+=			PKGCONFIGDIR=${PKGCONFIGDIR:S;${PREFIX}/;;}

CONFIGURE_ARGS+=		--mandir=${MANPREFIX}/man \
				--disable-rpath \
				--disable-rpath-install \
				--bundled-libraries=NONE \
				--builtin-libraries=replace \
				--without-gettext
CONFIGURE_ENV=			PYTHONHASHSEED=1
MAKE_ENV=			PYTHONHASHSEED=1

OPTIONS_DEFINE=			MANPAGES DEBUG PYTHON
OPTIONS_DEFAULT=		PYTHON
OPTIONS_SUB=			yes

MANPAGES_DESC=		Build and install manpages (requires textproc/docbook-xsl)

PYTHON_USES=                  gettext-runtime python:3.6+
PYTHON_USES_OFF=              python:build,test
PYTHON_CONFIGURE_OFF=         --disable-python

DEBUG_CONFIGURE_ON=	--verbose --enable-debug
DEBUG_MAKE_ARGS=	--verbose
DEBUG_FLAGS=		-g -ggdb3 -O0

.include <bsd.mport.options.mk>

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

post-patch:
			@${REINPLACE_CMD} -e 's|%%PKGCONFIGDIR%%|${PKGCONFIGDIR}|g' \
				${BUILD_WRKSRC}/wscript

pre-build-MANPAGES-off:
			-${MKDIR} ${BUILD_WRKSRC}/bin/default/man
			${INSTALL_MAN} ${FILESDIR}/talloc.3 ${BUILD_WRKSRC}/bin/default/man

post-install:
			${STRIP_CMD} ${PREFIX}/lib/libtalloc.so

post-install-PYTHON-on:
			${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/lib/libpytalloc-util*.so
			${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/talloc*.so

.include <bsd.port.post.mk>
