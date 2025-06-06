PORTNAME=	cherrypy
PORTVERSION=	18.8.0
PORTREVISION=	0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	CherryPy-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pythonic, object-oriented web development framework
WWW=		http://www.cherrypy.org/

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pip>0:devel/py-pip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>0:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cheroot>=8.2.1:www/py-cheroot@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jaraco.collections>=4.2.0:devel/py-jaraco.collections@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}more-itertools>0:devel/py-more-itertools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}portend>=2.1.1:net/py-portend@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.11.0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}zclockfile>0:devel/py-zclockfile@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	autoplist concurrent distutils
PYTEST_BROKEN_TESTS=	test_0_NormalStateFlow test_8_Ram_Cleanup \
			test_multipart_decoding \
			test_multipart_decoding_bigger_maxrambytes test_pass \
			test_4_File_deletion test_3_Redirect \
			test_threadlocal_garbage
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
