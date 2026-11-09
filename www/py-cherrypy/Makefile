PORTNAME=	cherrypy
PORTVERSION=	18.10.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pythonic, object-oriented web development framework
WWW=		https://www.cherrypy.dev/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm8>=8.1.0<9:devel/py-setuptools-scm8@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cheroot>=8.2.1:www/py-cheroot@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jaraco.collections>=4.2.0:devel/py-jaraco.collections@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}more-itertools>0:devel/py-more-itertools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}portend>=2.1.1:net/py-portend@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}zclockfile>0:devel/py-zclockfile@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=7.2.2:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}objgraph>=3.5.0:devel/py-objgraph@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}path.py>0:devel/py-path.py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=2.9.0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-forked>=1.6.0:devel/py-pytest-forked@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-services>=2:devel/py-pytest-services@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-sugar>=0.9.7:devel/py-pytest-sugar@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-memcached>=1.59:databases/py-python-memcached@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests-toolbelt>0:www/py-requests-toolbelt@${PY_FLAVOR} \
		${PY_SETUPTOOLS}

USES=		cpe python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

_CHERRYPY_SCM_PATH?=	${PYTHON_LIBDIR}/mports-setuptools-scm/8
MAKE_ENV+=	PYTHONPATH=${_CHERRYPY_SCM_PATH}
NO_ARCH=	yes
NO_TEST=	yes
PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

EXAMPLES_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cheetah3>0:devel/py-cheetah3@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sqlobject>=1.5.1:databases/py-sqlobject@${PY_FLAVOR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/cherrypy/tutorial && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR})
	(cd ${FAKE_DESTDIR}${PREFIX} && \
	${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		-d ${EXAMPLESDIR} ${EXAMPLESDIR:S,${PREFIX}/,,})

.include <bsd.port.mk>
