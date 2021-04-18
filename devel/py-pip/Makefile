PORTNAME=	pip
PORTVERSION=	20.2.3
CATEGORIES=	devel python
MASTER_SITES=	https://files.pythonhosted.org/packages/f9/d3/955738b20d3832dfa3cd3d9b07e29a8162edb480bf988332f5e6e48ca444/:test_setuptools \
		https://files.pythonhosted.org/packages/a7/00/3df031b3ecd5444d572141321537080b40c1c25e1caa3d86cdd12e5e919c/:test_wheel
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	setuptools-44.0.0-py2.py3-none-any.whl:test_setuptools \
		wheel-0.35.1-py2.py3-none-any.whl:test_wheel
DIST_SUBDIR=	${PORTNAME}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for installing and managing Python packages

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python:3.7+ shebangfix

#OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pypa-docs-theme>=g20180622:textproc/py-pypa-docs-theme@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx>0:textproc/py-sphinx@${PY_FLAVOR}
DOCS_PORTDOCS=		*
DOCS_VARS=		PYDISTUTILS_BUILD_TARGET=build_sphinx \
			PYDISTUTILS_BUILDARGS="-n --all-files --fresh-env"
MAKE_ENV=		PYTHONPATH=${WRKSRC}/src/

USE_GITHUB=	yes
USE_PYTHON=	autoplist concurrent distutils

SHEBANG_FILES=	src/pip/__init__.py

GH_ACCOUNT=	pypa

NO_ARCH=	yes
NO_TEST=	yes

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/build/sphinx/html && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -name objects.inv")

.include <bsd.port.mk>
