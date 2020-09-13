# Created by: Yasuhiro KIMURA <yasu@utahime.org>

PORTNAME=	authres
PORTVERSION=	1.2.0
CATEGORIES=	mail python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python module for RFC 5451 Authentication-Results headers

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

PLIST_SUB=	PORTNAME=${PORTNAME}

PORTDOCS=	CHANGES README

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
