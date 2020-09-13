PORTNAME=	multidict
PORTVERSION=	4.7.5
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multidict implementation

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.4+
USE_PYTHON=	autoplist cython distutils

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/multidict/*.so

.include <bsd.port.mk>
