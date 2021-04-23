# Created by: David Naylor <dbn@FreeBSD.org>

PORTNAME=	typed-ast
PORTVERSION=	1.4.2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	typed_ast-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fork of Python ast modules with type comment support

LICENSE=	apache2 python
LICENSE_COMB=	multi

USES=		python:3.5+
USE_PYTHON=	autoplist concurrent distutils

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/typed_ast/*.so

.include <bsd.port.mk>
