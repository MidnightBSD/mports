PORTNAME=	CommonMark
PORTVERSION=	0.9.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	commonmark-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python parser for the CommonMark Markdown spec
WWW=		https://github.com/rtfd/CommonMark-py

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}future>0:devel/py-future@${PY_FLAVOR}

CONFLICTS_INSTALL=	cmark

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
