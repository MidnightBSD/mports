# Created by: D'Arcy Cain <darcy@druid.net>

PORTNAME=	weasyprint
PORTVERSION=	69.0
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts HTML/CSS documents to PDF
WWW=		https://weasyprint.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.2:devel/py-flit-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}flit-core<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pydyf>=0.11.0:print/py-pydyf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cffi>=0.6:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tinyhtml5>=2.0.0b1:textproc/py-tinyhtml5@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tinycss2>=1.5.0:textproc/py-tinycss2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cssselect2>=0.8.0:textproc/py-cssselect2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyphen>=0.9.1:textproc/py-pyphen@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pillow>=9.1.0:graphics/py-pillow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fonttools>=4.59.2:print/py-fonttools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}brotli>=1.0.1:archivers/py-brotli@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}zopfli>=0.1.4:archivers/py-zopfli@${PY_FLAVOR}

USES=		ghostscript:test gnome python:3.11+
USE_PYTHON=	autoplist pep517 pytest
USE_GNOME=	gdkpixbuf pango

NO_ARCH=	yes

TEST_WRKSRC=	${WRKDIR}
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC} \
		PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
TEST_ARGS=	--import-mode=importlib ${WRKSRC}/tests

.include <bsd.port.mk>
