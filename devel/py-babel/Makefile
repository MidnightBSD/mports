# $MidnightBSD$

PORTNAME=	Babel
PORTVERSION=	1.3
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of tools for internationalizing Python applications

LICENSE=	bsd3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytz>0:${PORTSDIR}/devel/py-pytz

USE_PYTHON=		2.7+
USE_PYDISTUTILS=	easy_install
PYDISTUTILS_AUTOPLIST=	yes

PORTDOCS=	docs/*

.include <bsd.mport.options.mk>

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
.for docfile in ${PORTDOCS}
	${CP} -r ${WRKSRC}/${docfile} ${STAGEDIR}${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
