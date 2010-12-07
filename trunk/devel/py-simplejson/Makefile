# $MidnightBSD$

PORTNAME=	simplejson
PORTVERSION=	2.1.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simplejson is a simple, fast, extensible JSON encoder/decoder
LICENSE=	python

USE_PYTHON=	2.4+
USE_PYDISTUTILS=	easy_install
PYEASYINSTALL_ARCHDEP=	yes

DOCSDIR=	${PREFIX}/share/doc/${PYTHON_PKGNAMEPREFIX}${PORTNAME}

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC}/docs/ && ${COPYTREE_SHARE} . ${DOCSDIR})
.endif

.include <bsd.port.mk>
