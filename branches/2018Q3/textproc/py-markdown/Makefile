# $MidnightBSD$
# $FreeBSD: head/textproc/py-markdown/Makefile 412349 2016-04-01 14:25:16Z mat $

PORTNAME=	markdown
PORTVERSION=	2.6.5
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Markdown-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python implementation of Markdown

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.md

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}nose>0:devel/py-nose \
		${PYTHON_PKGNAMEPREFIX}pytidylib>0:textproc/py-pytidylib \
		${PYTHON_PKGNAMEPREFIX}pygments>0:textproc/py-pygments \
		${PYTHON_PKGNAMEPREFIX}yaml>0:devel/py-yaml

USES=		python
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
