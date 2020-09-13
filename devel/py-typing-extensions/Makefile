# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	typing-extensions
PORTVERSION=	3.7.4.2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	typing_extensions-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backported and Experimental Type Hints for Python 3.5+

LICENSE=	python
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PY_TYPING}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
