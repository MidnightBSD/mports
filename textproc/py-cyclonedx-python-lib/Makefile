PORTNAME=	cyclonedx-python-lib
PORTVERSION=	11.12.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI \
		https://github.com/CycloneDX/cyclonedx-python-lib/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	cyclonedx_python_lib-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for producing CycloneDX SBOM files
WWW=		https://github.com/CycloneDX/cyclonedx-python-lib

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.0.0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}license-expression>=30<31:textproc/py-license-expression@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packageurl-python>=0.11<2:textproc/py-packageurl-python@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}py-serializable>=2.1.0<3:devel/py-py-serializable@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sortedcontainers>=2.4.0<3:devel/py-sortedcontainers@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31300
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.6<5:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
