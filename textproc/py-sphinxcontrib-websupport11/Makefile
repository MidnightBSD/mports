PORTNAME=	sphinxcontrib-websupport
PORTVERSION=	1.1.2
CATEGORIES=	textproc
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx API for Web Apps

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

# sphinxcontrib-websupport 1.2.0+ requires Python 3.5+
PORTSCOUT=	limit:^1\.1\.

.include <bsd.port.mk>
