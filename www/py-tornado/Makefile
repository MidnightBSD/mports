# Created by: Guixing Bai <khsing.cn@gmail.com>

PORTNAME=	tornado
PORTVERSION=	5.1.1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Web Server from FriendFeed

LICENSE=	apache2

RUN_DEPENDS=	${PY_FUTURES}

USES=		python
USE_PYTHON=	autoplist distutils

NO_TEST=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}tornado4 \
			${PYTHON_PKGNAMEPREFIX}tornado6

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3400
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}singledispatch>0:devel/py-singledispatch@${PY_FLAVOR}
.endif

.if ${PYTHON_REL} < 3500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}backports_abc>=0.4:devel/py-backports_abc@${PY_FLAVOR}
.endif

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/tornado/speedups.so

.include <bsd.port.post.mk>
