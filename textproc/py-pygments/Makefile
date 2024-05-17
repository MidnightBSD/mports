PORTNAME=	pygments
DISTVERSION=	2.17.2
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Syntax highlighter written in Python
WWW=		https://pygments.org/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.18.0:devel/py-hatchling@${PY_FLAVOR}
USES=		cpe python
USE_PYTHON=	autoplist concurrent pep517

CONFLICTS_INSTALL=	py??-pygments-25

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
