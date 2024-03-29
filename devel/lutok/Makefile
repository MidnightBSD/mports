# Created by: Alan Somers <asomers@FreeBSD.org>

PORTNAME=	lutok
PORTVERSION=	0.4
CATEGORIES=	devel
MASTER_SITES=	https://github.com/jmmv/lutok/releases/download/${PORTNAME}-${PORTVERSION}/ \
		FREEBSD_LOCAL/jmmv

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C++ API for Lua

LICENSE=	bsd3

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		libtool lua pkgconfig

OPTIONS_DEFINE=	DOCS EXAMPLES TEST
OPTIONS_DEFAULT=TEST

OPTIONS_SUB=		yes
TEST_CONFIGURE_WITH=	atf
TEST_BUILD_DEPENDS=	atf>=0.21:devel/atf
TEST_RUN_DEPENDS=	atf>=0.21:devel/atf

.include <bsd.mport.options.mk>

CONFIGURE_ARGS+=	--docdir=${DOCSDIR}
CONFIGURE_ARGS+=	--htmldir=${DOCSDIR}/html
# The distfile contains prebuilt doxygen files.  Specify --without_doxygen so
# we won't rebuild them
CONFIGURE_ARGS+=	--without-doxygen

# Force the use of the lua version we have chosen via USE_LUA.  If we allow
# lutok's configure script search for one using pkgconfig files, it might pick
# a different version.
CONFIGURE_ARGS+=	LUA_CFLAGS="-I${LUA_INCDIR}"
CONFIGURE_ARGS+=	LUA_LIBS="-L${LUA_LIBDIR} -llua-${LUA_VER} -lm"

MAKE_FLAGS+=	examplesdir=${FAKE_DESTDIR}${EXAMPLESDIR}
MAKE_FLAGS+=	pkgconfigdir=${PREFIX}/libdata/pkgconfig
.if ! ${PORT_OPTIONS:MDOCS}
MAKE_FLAGS+=	doc_DATA=
.endif
.if ! ${PORT_OPTIONS:MEXAMPLES}
MAKE_FLAGS+=	examples_DATA=
.endif

PLIST_SUB+=	TESTS="@comment "

.if ! ${PORT_OPTIONS:MDOCS}
pre-install: .SILENT
	${RM} -r ${WRKSRC}/api-docs
.endif

post-fake-EXAMPLES-on:
	${MV} ${FAKE_DESTDIR}${DOCSDIR}/examples ${FAKE_DESTDIR}${EXAMPLESDIR}
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}/${PREFIX}/tests/lutok/examples_test

.include <bsd.port.mk>
