PORTNAME=	mistune
PORTVERSION=	0.8.4
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fastest markdown parser in pure Python
WWW=		https://github.com/lepture/mistune

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe python:3.6+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

CPE_VENDOR=	mistune_project

PORTSCOUT=	limit:^0\.

.include <bsd.port.mk>
