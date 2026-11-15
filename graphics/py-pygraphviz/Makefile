PORTNAME=	pygraphviz
PORTVERSION=	2.0
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to GraphViz agraph
WWW=		https://pygraphviz.github.io

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	swig>4.1.0:devel/swig
LIB_DEPENDS=	libcgraph.so:graphics/graphviz

USES=		pkgconfig python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_WRKSRC=	${WRKDIR}
TEST_ARGS=	--pyargs pygraphviz

MAKE_ENV=	GRAPHVIZ_PREFIX=${LOCALBASE}
LDFLAGS+=	-Wl,-rpath,${LOCALBASE}/lib/graphviz

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/pygraphviz/_graphviz*.so

.include <bsd.port.mk>
