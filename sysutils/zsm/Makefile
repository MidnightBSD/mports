PORTNAME=	zsm
PORTVERSION=	0.4.0
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZFS Snapshot Manager
WWW=		https://zsm.rtfd.io/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}click>=8.0.1:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pid>=3.0.4:devel/py-pid@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=5.4.1:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}marshmallow>=3.13.0:devel/py-marshmallow@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils noflavors

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
