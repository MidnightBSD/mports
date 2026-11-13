PORTNAME=	amaranth
DISTVERSIONPREFIX=	v
DISTVERSION=	0.5.10
CATEGORIES=	cad python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Amaranth hardware definition language
WWW=		https://amaranth-lang.org/docs/amaranth/latest/ \
		https://github.com/amaranth-lang/amaranth

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend23>=2.3.0<2.4:devel/py-pdm-backend23@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Jinja2>=3.0<4:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jschon>=0.11.1<0.12:devel/py-jschon@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyvcd04>=0.2.2<0.5:cad/py-pyvcd04@${PY_FLAVOR}
TEST_DEPENDS=	sby:cad/symbiyosys \
		yices_smt2:math/yices \
		yosys:cad/yosys

USES=		python:3.8+
USE_PYTHON=	autoplist pep517 pytest

USE_GITHUB=	yes
GH_ACCOUNT=	amaranth-lang

PDM23_BUILD_PATH?=	${PYTHONPREFIX_LIBDIR}/mports-pdm-backend/23
MAKE_ENV+=	PDM_BUILD_SCM_VERSION=${DISTVERSION} \
		PYTHONPATH=${PDM23_BUILD_PATH}
TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

PORTDOCS=	*
PORTEXAMPLES=	*

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install-DOCS-on:
	@cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .gitignore"

do-install-EXAMPLES-on:
	@cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 30900
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-resources>=0:devel/py-importlib-resources@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
