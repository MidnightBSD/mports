# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	packaging
PORTVERSION=	20.3
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core utilities for Python packages

LICENSE=	apache2 bsd2
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.APACHE
LICENSE_FILE_bsd2=${WRKSRC}/LICENSE.BSD

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyparsing>=2.0.2:devel/py-pyparsing@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
