PORTNAME=	sphinxcontrib-websupport
PORTVERSION=	1.2.4
CATEGORIES=	textproc
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx API for Web Apps

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinxcontrib-serializinghtml>=0:textproc/py-sphinxcontrib-serializinghtml@${PY_FLAVOR}

USES=		python:3.5+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
