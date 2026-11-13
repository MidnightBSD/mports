PORTNAME=	pyinstaller-hooks-contrib
DISTVERSION=	2026.6
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyinstaller_hooks_contrib-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	bsd.hsw@gmail.com
COMMENT=	Community maintained hooks for pyinstaller
WWW=		https://pypi.org/project/pyinstaller-hooks-contrib/

LICENSE=	Apache-2.0 gpl2+
LICENSE_COMB=	multi
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE
LICENSE_FILE_gpl2+=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=22:devel/py-packaging@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sounddevice>=0.5.6_1:audio/py-sounddevice@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}execnet>0:sysutils/py-execnet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyinstaller>=6.22.2:devel/py-pyinstaller@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-drop-dup-tests>0:devel/py-pytest-drop-dup-tests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>0:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>0:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		cpe python:3.8+
USE_PYTHON=	autoplist concurrent pep517 pytest

EXTRACT_AFTER_ARGS=	--no-same-owner --no-same-permissions

USE_GITHUB=	nodefault
GH_TUPLE=	pyinstaller:pyinstaller-hooks-contrib:791432e2a150b2282f8048df71c9ec3665aabb48:tests

NO_ARCH=	yes

TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		PYTHONDONTWRITEBYTECODE=1
TEST_WRKSRC=	${WRKDIR}
TEST_ARGS=	-c ${WRKSRC}/setup.cfg ${WRKSRC}/tests --maxfail=3 -m "not slow" -v -rsfE --doctest-glob= -p no:legacypath

post-extract:
	${CP} -R ${WRKSRC_tests}/tests/. ${WRKSRC}/tests/

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=4.6:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
