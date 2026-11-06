PORTNAME=	bleach
PORTVERSION=	6.4.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy safelist-based HTML-sanitizing tool
WWW=		https://bleach.readthedocs.io/en/latest/ \
		https://github.com/mozilla/bleach

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	multi
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/bleach/_vendor/html5lib-1.1.dist-info/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}webencodings>=0:converters/py-webencodings@${PY_FLAVOR}

USES=		cpe python:3.10+ shebangfix
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

CPE_VENDOR=	mozilla

SHEBANG_FILES=	bleach/_vendor/vendor_install.sh

OPTIONS_DEFINE=	CSS
OPTIONS_DEFAULT=CSS
CSS_DESC=	CSS support

CSS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tinycss2>=1.1.0:textproc/py-tinycss2@${PY_FLAVOR}

.include <bsd.port.mk>
