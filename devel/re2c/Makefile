PORTNAME=	re2c
DISTVERSION=	3.0
CATEGORIES=	devel
MASTER_SITES=	https://github.com/skvadrik/${PORTNAME}/releases/download/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lexer generator for C, C++ and Go with a focus on generating fast code
WWW=		https://re2c.org/

LICENSE=	publicdom

TEST_DEPENDS=	bash:shells/bash

USES=		cmake cpe python:test shebangfix tar:xz

NO_TEST=	yes
#TEST_TARGET=	check
SHEBANG_FILES=	test/posix_captures/.run/__run.sh \
		test/posix_captures/.gen/__gen.sh \
		test/__run_unicode_tests.sh

OPTIONS_DEFINE=		DOCS EXAMPLES LIBRE2C RE2GO RE2RUST
OPTIONS_DEFAULT=	RE2GO RE2RUST
OPTIONS_SUB=		yes

LIBRE2C_DESC=		Build libre2c (Experimental)
RE2GO_DESC=		Build RE2GO (identical to re2c --lang go)
RE2RUST_DESC=		Build RE2RUST (identical to re2c --lang rust)

DOCS_BUILD_DEPENDS=	bison:devel/bison \
			rst2man:textproc/py-docutils
DOCS_CMAKE_BOOL=	RE2C_REBUILD_DOCS
LIBRE2C_CMAKE_BOOL=	RE2C_BUILD_LIBS BUILD_SHARED_LIBS
RE2GO_CMAKE_BOOL=	RE2C_BUILD_RE2GO
RE2RUST_CMAKE_BOOL=	RE2C_BUILD_RE2RUST

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/doc/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR})

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
