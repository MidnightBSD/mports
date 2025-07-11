PORTNAME=	sphinxcontrib-autoprogram
DISTVERSION=	0.1.9
CATEGORIES=	textproc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx Autoprogram Extension
WWW=		https://github.com/sphinx-contrib/autoprogram

LICENSE=	bsd2

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=1.2,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=1.2,1:textproc/py-sphinx@${PY_FLAVOR}
DOCS_PORTDOCS=		*

post-extract:
	@(cd ${BUILD_WRKSRC}; ${RM} sphinxcontrib/__init__.py;)

pre-build-DOCS-on:
	@(cd ${BUILD_WRKSRC}; \
	${SETENVI} ${WRK_ENV} \
	sphinx-build-${PYTHON_VER} \
		-b html -d _build/doctress doc/ build/sphinx/html)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/build/sphinx/html && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} \
		"! -name .buildinfo -and ! -name objects.inv")

.include <bsd.port.mk>
