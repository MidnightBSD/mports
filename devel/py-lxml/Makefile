PORTNAME=	lxml
PORTVERSION=	4.9.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pythonic binding for the libxml2 and libxslt libraries
WWW=		https://lxml.de/ \
		https://github.com/lxml/lxml

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/doc/licenses/BSD.txt

USES=		compiler cpe gnome python uniquefiles:dirs
USE_GNOME=	libxml2 libxslt
USE_PYTHON=	autoplist concurrent cython distutils

LDFLAGS+=	-Wl,-rpath=${LOCALBASE}/lib

DOCS_FILES=	CHANGES.txt CREDITS.txt TODO.txt README.rst
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

# needed for test to work
PYDISTUTILS_BUILD_TARGET=	build_ext
PYDISTUTILS_BUILDARGS=		--inplace

# force regeneration of cython files
post-extract:
	@${FIND} ${WRKSRC} -name "*.c" -delete

post-install:
	@${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		-name '*.so' -exec ${STRIP_CMD} {} +

post-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCS_FILES:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} doc ${STAGEDIR}${DOCSDIR}

.include <bsd.port.pre.mk>

# if using gcc, force modern GCC due to use of #pragma
.if ${CHOSEN_COMPILER_TYPE} == gcc
USE_GCC=	yes
.endif

.include <bsd.port.post.mk>
