# Created by: Hye-Shik Chang

PORTNAME=	pycurl
PORTVERSION=	7.43.0.6
CATEGORIES=	ftp python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to libcurl

LICENSE=	lgpl2.1 mit
LICENSE_COMB=	dual

LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		python:3.6+ ssl
USE_PYTHON=	autoplist concurrent distutils

PORTDOCS=	AUTHORS INSTALL.rst README.rst RELEASE-NOTES.rst

OPTIONS_DEFINE=	DOCS

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}*.so

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
