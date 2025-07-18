PORTNAME=	lutok
DISTVERSION=	0.6.1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/freebsd/${PORTNAME}/releases/download/${DISTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C++ API for Lua
WWW=		https://github.com/freebsd/lutok/

LICENSE=	bsd3

USES=		autoreconf libtool lua pathfix pkgconfig
USE_CXXSTD=	gnu++14
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	LUA_CFLAGS="-I${LUA_INCDIR}"
CONFIGURE_ARGS+=	LUA_LIBS="-L${LUA_LIBDIR} -llua-${LUA_VER} -lm"

FAKE_MAKEFLAGS+=	examplesdir=${FAKE_DESTDIR}${EXAMPLESDIR}
INSTALL_TARGET=	install-strip

PORTDOCS=	AUTHORS COPYING NEWS README.md html/*

OPTIONS_DEFAULT= DOCS EXAMPLES TEST
OPTIONS_DEFINE=	DOCS EXAMPLES TEST
OPTIONS_SUB=		yes

DOCS_BUILD_DEPENDS=	doxygen>0:devel/doxygen
DOCS_CONFIGURE_ON=	--docdir=${DOCSDIR} --htmldir=${DOCSDIR}/html
DOCS_CONFIGURE_OFF=	--without-doxygen
DOCS_MAKE_ARGS_OFF=	doc_DATA=
EXAMPLES_MAKE_ARGS_OFF=	dist_examples_DATA=
TEST_CONFIGURE_ENABLE=	atf
TEST_BUILD_DEPENDS=	atf>=0.21:devel/atf
TEST_RUN_DEPENDS=	atf>=0.21:devel/atf

pre-install-DOCS-off:
	@${RM} -r ${WRKSRC}/api-docs

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/api-docs && ${COPYTREE_SHARE} html ${FAKE_DESTDIR}${DOCSDIR})
	${RM} -r ${FAKE_DESTDIR}${PREFIX}/share/doc/lutok/examples

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/ && ${CP} examples/* ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
