# Created by: ijliao

PORTNAME=	cssutils
PORTVERSION=	2.2.0
PORTEPOCH=	1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS Cascading Style Sheets library for Python

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	dual
LICENSE_FILE_gpl3=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl3=	${WRKSRC}/COPYING.LESSER

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=3.4.1:devel/py-setuptools_scm@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3800
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=0:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/examples/* ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.post.mk>
