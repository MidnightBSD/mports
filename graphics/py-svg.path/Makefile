PORTNAME=	svg_path
PORTVERSION=	7.1
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	port@MidnightBSD.org
COMMENT=	SVG path objects and parser
WWW=		https://pypi.org/project/svg.path/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61.2:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

post-patch:
	@${REINPLACE_CMD} -e 's|^name = "svg.path"|name = "svg_path"|' ${WRKSRC}/pyproject.toml

.include <bsd.port.mk>
