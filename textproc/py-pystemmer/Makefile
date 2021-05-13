# Created by: Wen Heping <wenheping@gmail.com>

PORTNAME=	pystemmer
PORTVERSION=	2.0.0.1
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP \
		http://snowball.tartarus.org/wrappers/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyStemmer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Snowball Stemming Algorithms for Information Retrieval

LICENSE=	mit bsd3
LICENSE_COMB=	dual

USES=		python:3.6+
USE_PYTHON=	cython distutils autoplist

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/Stemmer*.so

.include <bsd.port.mk>
