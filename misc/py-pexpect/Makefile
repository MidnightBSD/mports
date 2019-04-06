# Created by: ijliao

PORTNAME=	pexpect
PORTVERSION=	4.6.0
CATEGORIES=	misc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure Python Expect-like module

LICENSE=	iscl

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ptyprocess>=0:sysutils/py-ptyprocess@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.pre.mk>

.if ${PYTHON_PKGNAMEPREFIX} == "py27-"
PORTVERSION=    3.2
.endif

.include <bsd.port.post.mk>
