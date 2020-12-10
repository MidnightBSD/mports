# Created by: rene@FreeBSD.org (repocopied from audio/py-mpd)

PORTNAME=	python-mpd2
PORTVERSION=	2.0.0
CATEGORIES=	audio python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python MPD client library

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
