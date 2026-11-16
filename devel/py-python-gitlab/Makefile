PORTNAME=	python-gitlab
DISTVERSION=	8.6.0
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interact with GitLab API
WWW=		https://github.com/python-gitlab/python-gitlab

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}requests-toolbelt>=1.0.0:www/py-requests-toolbelt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.32.0:www/py-requests@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes
SUB_FILES=	pkg-message

OPTIONS_DEFINE=		AUTOCOMPLETE DOCS GRAPHQL YAML
OPTIONS_DEFAULT=	AUTOCOMPLETE GRAPHQL YAML

AUTOCOMPLETE_DESC=	Autocompletion via argcomplete
GRAPHQL_DESC=		GraphQL support
YAML_DESC=		YAML output

AUTOCOMPLETE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}argcomplete>=1.10.0<4:devel/py-argcomplete@${PY_FLAVOR}

DOCS_BUILD_DEPENDS=	py312-furo>0:textproc/py-furo@py312 \
			py312-Jinja2>0:devel/py-Jinja2@py312 \
			py312-myst-parser>0:textproc/py-myst-parser@py312 \
			py312-requests-toolbelt>=0.10.1:www/py-requests-toolbelt@py312 \
			py312-requests>=2.25.0:www/py-requests@py312 \
			py312-sphinx>=4.3.1,1:textproc/py-sphinx@py312 \
			py312-sphinxcontrib-autoprogram>0:textproc/py-sphinxcontrib-autoprogram@py312
DOCS_PORTDOCS=		*

GRAPHQL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gql>=3.5<5:devel/py-gql@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}httpx>0:www/py-httpx@${PY_FLAVOR}

GRAPHQL_TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}respx>0:www/py-respx@${PY_FLAVOR}

YAML_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=6.0.1:devel/py-pyyaml@${PY_FLAVOR}

post-patch:
	@${REINPLACE_CMD} -e 's|/etc|${LOCALBASE}/etc|g' ${WRKSRC}/gitlab/config.py

do-build-DOCS-on::
	(cd ${WRKSRC} && sphinx-build-3.12 -j auto -n -W --keep-going -b html docs build/sphinx/html)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/build/sphinx/html && \
	${RM} -r .doctrees && \
	${RM} .buildinfo objects.inv && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
