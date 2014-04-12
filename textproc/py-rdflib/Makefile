# $MidnightBSD$

PORTNAME=	rdflib
PORTVERSION=	4.1.1
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for RDF manipulation

LICENSE=	bsd3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}isodate>=0:${PORTSDIR}/devel/py-isodate \
	${PYTHON_PKGNAMEPREFIX}parsing>=2.0.1:${PORTSDIR}/devel/py-parsing \
	${PYTHON_PKGNAMEPREFIX}sparqlwrapper>=1.5.2:${PORTSDIR}/textproc/py-sparqlwrapper

USE_PYTHON=	yes
USE_PYDISTUTILS=yes
PYDISTUTILS_AUTOPLIST=	yes

.include <bsd.port.mk>
