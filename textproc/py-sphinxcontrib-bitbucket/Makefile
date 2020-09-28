# Created by: Nicola Vitale <nivit@FreeBSD.org>

PORTNAME=	sphinxcontrib-bitbucket
PORTVERSION=	1.0
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx/BitBucket integration

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PY_SPHINX} \
		${PYTHON_PKGNAMEPREFIX}docutils>=0.6:textproc/py-docutils@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
