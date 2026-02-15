PORTNAME=	mistune0
PORTVERSION=	0.8.4
PORTREVISION=	2
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	mistune-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fastest markdown parser in pure Python
WWW=		https://github.com/lepture/mistune

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
#TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}nose>=0:devel/py-nose@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

CPE_VENDOR=	mistune_project

PORTSCOUT=	limit:^0\.

post-patch:
	@${MV} ${WRKSRC}/mistune.py ${WRKSRC}/mistune0.py

do-test:
	cd ${WRKSRC} && ${PYTHON_CMD} -m nose -v

.include <bsd.port.mk>
