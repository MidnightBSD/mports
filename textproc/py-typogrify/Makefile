PORTNAME=	typogrify
DISTVERSION=	2.1.0
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	PYPI \
		https://github.com/justinmayer/typogrify/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Filters to enhance web typography
WWW=		https://github.com/justinmayer/typogrify

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}smartypants>0:textproc/py-smartypants@${PY_FLAVOR}

USES=		python shebangfix
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

SHEBANG_FILES=	typogrify/packages/titlecase/__init__.py

.include <bsd.port.mk>
