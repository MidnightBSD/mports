# $MidnightBSD$

PORTNAME=		autobahn
PORTVERSION=		0.17.2
DISTVERSIONPREFIX=	v
PORTREVISION=	1
CATEGORIES=		www python
PKGNAMEPREFIX=		${PYTHON_PKGNAMEPREFIX}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		WebSocket client & server library, WAMP real-time framework

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=1.6.1:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}txaio>=2.2.0:devel/py-txaio@${PY_FLAVOR}

USES=		python
USE_GITHUB=	yes
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

GH_ACCOUNT=	crossbario
GH_PROJECT=	autobahn-python

OPTIONS_DEFINE=		ACCELERATE SERIALIZATION
OPTIONS_DEFAULT=	ACCELERATE SERIALIZATION

BACKENDS_DESC=		Networking Backends

ACCELERATE_DESC=	WebSocket and JSON Acceleration
SERIALIZATION_DESC=	WAMPv2 Binary Serialization

ACCELERATE_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}wsaccel>=0.6.2:www/py-wsaccel@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}ujson>=1.33:devel/py-ujson@${PY_FLAVOR}

SERIALIZATION_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}msgpack>=0.4.0:devel/py-msgpack@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${FLAVOR} == python2
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}zope.interface>=3.6:devel/py-zope.interface@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}twisted>=12.1:devel/py-twisted@${PY_FLAVOR}
.elif ${FLAVOR} == python3 && ${PYTHON_REL} <= 3300
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}asyncio>=3.4.3:devel/py-asyncio@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
