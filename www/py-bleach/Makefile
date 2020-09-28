# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	bleach
PORTVERSION=	3.1.5
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy safelist-based HTML-sanitizing tool

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=1.9.0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}webencodings>0:converters/py-webencodings@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

# This is a development script
# TODO: Remove from sdist (via MANIFEST.ini)
post-extract:
	${RM} ${WRKSRC}/bleach/_vendor/pip_install_vendor.sh

.include <bsd.port.mk>
