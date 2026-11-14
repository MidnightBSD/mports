PORTNAME=	setuptools-scm
DISTVERSION=	9.2.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	9
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private setuptools-scm 9 build provider
WWW=		https://github.com/pypa/setuptools-scm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>=1.0.3:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}installer>=0.7:devel/py-installer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=20:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	allflavors flavors
NO_ARCH=	yes
_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/9

do-build:
	cd ${BUILD_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} -m build --no-isolation --wheel

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} ${BUILD_WRKSRC}/dist/setuptools_scm-${DISTVERSION}-*.whl

.include <bsd.port.pre.mk>
.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tomli>=1:textproc/py-tomli@${PY_FLAVOR}
.endif
.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=0:devel/py-typing-extensions@${PY_FLAVOR}
.endif
.include <bsd.port.post.mk>
