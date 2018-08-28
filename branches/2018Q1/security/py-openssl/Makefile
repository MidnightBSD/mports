# $MidnightBSD$
# $FreeBSD: head/security/py-openssl/Makefile 413233 2016-04-13 22:45:29Z sbz $

PORTNAME=	openssl
PORTVERSION=	16.0.0
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyOpenSSL-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to the OpenSSL library

LICENSE=	apache2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=0.2.1:${PORTSDIR}/security/py-cryptography \
		${PYTHON_PKGNAMEPREFIX}six>=1.5.2:${PORTSDIR}/devel/py-six

OPTIONS_DEFINE=	EXAMPLES

USES=		cpe python
USE_PYTHON=	autoplist concurrent distutils pythonprefix

CPE_VENDOR=	jean-paul_calderone
CPE_PRODUCT=	py${PORTNAME}

EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}
PORTEXAMPLES=	*

post-install:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR})

regression-test: build
	@(cd ${WRKSRC} && ${PYTHON_CMD} ${PYSETUP} test)

.include <bsd.port.mk>
