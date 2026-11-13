PORTNAME=	QtAwesome
DISTVERSION=	1.4.2
CATEGORIES=	x11-fonts graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${PORTNAME:tl}-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Iconic fonts in PyQt and PySide applications
WWW=		https://github.com/spyder-ide/qtawesome

LICENSE=	Apache-2.0 CC-BY-4.0 OFL11 mit
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}QtPy>0:devel/py-QtPy@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-qt>0:devel/py-pytest-qt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}qt5-pyqt>0:devel/py-qt5-pyqt@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist pytest

WRKSRC=		${WRKDIR}/${PORTNAME:tl}-${DISTVERSION}

NO_ARCH=	yes

TEST_ENV=	QT_QPA_PLATFORM=offscreen PYTHONSAFEPATH=1 PYTHONDONTWRITEBYTECODE=1 \
		QT_API=pyqt5 PYTEST_QT_API=pyqt5
TEST_WRKSRC=	${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_ARGS=	--import-mode=importlib -o cache_dir=${WRKDIR}/.pytest_cache qtawesome/tests

.include <bsd.port.mk>
