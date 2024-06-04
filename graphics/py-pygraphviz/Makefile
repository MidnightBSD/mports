PORTNAME=	pygraphviz
PORTVERSION=	1.6
PORTREVISION=	1
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to GraphViz agraph
WWW=		https://pygraphviz.github.io

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libcgraph.so:graphics/graphviz

USES=		pkgconfig python zip
USE_PYTHON=	autoplist concurrent distutils

NO_TEST=	yes

PYDISTUTILS_BUILD_TARGET=	build build_ext
PYDISTUTILS_BUILDARGS=		--include-dirs=${LOCALBASE}/include \
				--library-dirs=${LOCALBASE}/lib/graphviz

post-patch:
	@${REINPLACE_CMD} -e 's+%%LOCALBASE%%+${LOCALBASE}+; \
		s+^docdirbase.*=.*+docdirbase = "${DOCSDIR:S/${PREFIX}\///}"+' ${WRKSRC}/setup.py

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/pygraphviz/_graphviz*.so

.include <bsd.port.mk>
