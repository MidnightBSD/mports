PORTNAME=	sphinxcontrib-autoprogram
PORTVERSION=	0.1.7
CATEGORIES=	textproc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx Autoprogram Extension
WWW=		https://github.com/sphinx-contrib/autoprogram

LICENSE=	bsd2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=1.2,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=1.2,1:textproc/py-sphinx@${PY_FLAVOR}
DOCS_PORTDOCS=		*
DOCS_VARS=		PYDISTUTILS_BUILD_TARGET=build_sphinx \
			PYDISTUTILS_BUILDARGS="-n --all-files --fresh-env"

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/build/sphinx/html && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -name objects.inv")

do-test:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
