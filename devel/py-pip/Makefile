PORTNAME=	pip
PORTVERSION=	23.3.2
CATEGORIES=	devel python
MASTER_SITES=	https://files.pythonhosted.org/packages/c3/9e/8a7ba2c9984a060daa6c6f9fff4d576b7ace3936239d6b771541eab972ed/:test_setuptools \
		https://files.pythonhosted.org/packages/61/86/cc8d1ff2ca31a312a25a708c891cf9facbad4eae493b3872638db6785eb5/:test_wheel
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	setuptools-67.6.0-py3-none-any.whl:test_setuptools \
		wheel-0.40.0-py3-none-any.whl:test_wheel
DIST_SUBDIR=	${PORTNAME}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for installing and managing Python packages
WWW=		https://pip.pypa.io/en/latest/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cpe python shebangfix
CPE_VENDOR=	pypa
USE_PYTHON=	autoplist concurrent distutils pytest

MAKE_ENV=	PYTHONPATH=${WRKSRC}/src/
NO_ARCH=	yes
NO_TEST=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	pypa

SHEBANG_FILES=	src/pip/__init__.py

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}furo>=0:textproc/py-furo@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}myst-parser>=0:textproc/py-myst-parser@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx>=4.2,1<6.0,1:textproc/py-sphinx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-copybutton>=0:textproc/py-sphinx-copybutton@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-inline-tabs>=0:textproc/py-sphinx-inline-tabs@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinxcontrib-towncrier>=0.2.0a0:textproc/py-sphinxcontrib-towncrier@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}towncrier>=0:textproc/py-towncrier@${PY_FLAVOR}
DOCS_PORTDOCS=		*
DOCS_VARS=		PYDISTUTILS_BUILD_TARGET=build_sphinx \
			PYDISTUTILS_BUILDARGS="-n --all-files --fresh-env"

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/build/sphinx/html && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -name objects.inv")

.include <bsd.port.mk>
