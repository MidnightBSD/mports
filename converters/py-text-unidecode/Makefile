PORTNAME=	text-unidecode
DISTVERSION=	1.3
CATEGORIES=	converters python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Most basic port of Perl's Text::Unidecode module
WWW=		https://github.com/kmike/text-unidecode

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_artistic=	${WRKSRC}/LICENSE
LICENSE_FILE_gpl+ =	${WRKSRC}/LICENSE

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} -m pytest -rs -v

.include <bsd.port.mk>
