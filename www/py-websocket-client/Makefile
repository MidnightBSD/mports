# Created by: Alfred Perlstein <alfred@freebsd.org>

PORTNAME=	websocket-client
PORTVERSION=	0.56.0
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
# Newer version is called "websocket_client"
# but to keep compat with old portname we fixup
# "-" to "_" here.
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Websocket client for python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils concurrent autoplist

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}backports.ssl_match_hostname>0:security/py-backports.ssl_match_hostname@${PY_FLAVOR}
.endif

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.post.mk>
