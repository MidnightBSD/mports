PORTNAME=	outcome
PORTVERSION=	1.2.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Capture the outcome of Python function calls
WWW=		https://pypi.org/project/outcome/

LICENSE=	mit Apache-2.0
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.MIT
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.APACHE2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>0:devel/py-attrs@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
