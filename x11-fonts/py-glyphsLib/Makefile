PORTNAME=	glyphsLib
DISTVERSION=	6.9.5
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	glyphslib-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bridge from Glyphs source files (.glyphs) to UFOs
WWW=		https://github.com/googlefonts/glyphsLib

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	multi
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/Lib/glyphsLib/data/GlyphData_LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=45:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fonttools>=4.38.0:print/py-fonttools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fs2>=2.2<3:filesystems/py-fs2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}openstep-plist>=0.3.0:textproc/py-openstep-plist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ufolib2>=0.6.2:print/py-ufolib2@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	DEFCON UFO_NORMALIZATION
OPTIONS_DEFAULT=	DEFCON UFO_NORMALIZATION
DEFCON_DESC=	UFO support via py-defcon
UFO_NORMALIZATION_DESC=	Normalize UFOs with py-ufonormalizer

DEFCON_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}defcon>=0.6.0:x11-fonts/py-defcon@${PY_FLAVOR}
UFO_NORMALIZATION_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ufonormalizer>=0:x11-fonts/py-ufonormalizer@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 30900
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-resources>=1.3:devel/py-importlib-resources@${PY_FLAVOR}
.endif
.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}unicodedata2>=14.0.0:devel/py-unicodedata2@${PY_FLAVOR}
.elif ${PYTHON_REL} < 31500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}unicodedata2>=17.0.0:devel/py-unicodedata2@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
