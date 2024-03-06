PORTNAME=	mistune
PORTVERSION=	2.0.4
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fastest markdown parser in pure Python
WWW=		https://github.com/lepture/mistune

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe python
USE_PYTHON=	autoplist concurrent distutils unittest

NO_ARCH=	yes

CPE_VENDOR=	mistune_project

post-patch:
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}/

.include <bsd.port.mk>
