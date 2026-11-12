PORTNAME=	python-mpd2
PORTVERSION=	3.1.2
DISTVERSIONPREFIX=	v
CATEGORIES=	audio python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python MPD client library

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61.0:devel/py-setuptools@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	Mic92

OPTIONS_DEFINE=	DOCS TWISTED
TWISTED_DESC=	Twisted support

TWISTED_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}twisted>=0:devel/py-twisted@${PY_FLAVOR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
