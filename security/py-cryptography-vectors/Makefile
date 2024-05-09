PORTNAME=	cryptography-vectors
PORTVERSION=	42.0.5
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	cryptography_vectors-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test vectors for the cryptography package
WWW=		https://cryptography.io/en/latest/development/test-vectors/ \
		https://github.com/pyca/cryptography/tree/main/vectors

LICENSE=	apache2 bsd3
LICENSE_COMB=	dual

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.2<4:devel/py-flit-core@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
