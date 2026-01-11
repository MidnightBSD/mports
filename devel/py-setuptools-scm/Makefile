PORTNAME=	setuptools-scm
PORTVERSION=	8.0.4
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Setuptools plugin to manage your versions by scm tags
WWW=		https://setuptools-scm.readthedocs.io/en/latest/ \
		https://github.com/pypa/setuptools-scm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR} \
		${PY_TOMLI} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=20:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PY_TOMLI} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=0:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
# circular references for test
NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e '497,521s|"gpg|"gpg2|' ${WRKSRC}/testing/test_git.py
	@${REINPLACE_CMD} -e 's/"GIT_SSH", "GIT_SSH_COMMAND"/"GIT_SSH", "GIT_SSH_COMMAND", "GIT_CEILING_DIRECTORIES"/' ${WRKSRC}/src/setuptools_scm/_run_cmd.py

.include <bsd.port.mk>
