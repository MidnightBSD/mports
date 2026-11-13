PORTNAME=	glyphsets
PORTVERSION=	1.1.3
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python API for evaluating coverage of glyph sets in font projects
WWW=		https://github.com/googlefonts/glyphsets

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=45:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm8>=8.1.0<8.2:devel/py-setuptools-scm8@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}defcon>=0:x11-fonts/py-defcon@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fonttools>=0:print/py-fonttools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fs2>=2.2<3:filesystems/py-fs2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}gflanguages>=0.7.9:x11-fonts/py-gflanguages@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}glyphsLib>=6.9.5:x11-fonts/py-glyphsLib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tabulate>=0:devel/py-tabulate@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}unicodedata2>=0:devel/py-unicodedata2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}youseedee>=0:textproc/py-youseedee@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517

SCM8_BUILD_PATH?=	${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/8
MAKE_ENV+=	PYTHONPATH=${SCM8_BUILD_PATH}

NO_ARCH=	yes

post-patch:
	${MKDIR} ${WRKSRC}/Lib/glyphsets/data
	${CP} ${WRKSRC}/data/empty_font.glyphs ${WRKSRC}/Lib/glyphsets/data/
	${CP} -R ${WRKSRC}/data/definitions ${WRKSRC}/Lib/glyphsets/data/

.include <bsd.port.mk>
