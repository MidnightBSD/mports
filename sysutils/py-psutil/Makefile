# Created by: Ju Pengfei <jupengfei@gmail.com>

PORTNAME=	psutil
PORTVERSION=	5.4.7
CATEGORIES=	sysutils python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Process utilities module for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PY_ENUM34}
TEST_DEPENDS=	${PY_IPADDRESS}

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}psutil121

USE_PYTHON=	autoplist concurrent distutils
USES=		python

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/psutil/_psutil_bsd.so ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/psutil/_psutil_posix.so

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3000
TEST_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
