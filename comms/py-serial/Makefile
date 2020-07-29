# Created by: Hye-Shik Chang <perky@fallin.lv>

PORTNAME=	serial
PORTVERSION=	3.4
CATEGORIES=	comms python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serial port encapsulation library for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=			python
USE_PYTHON=		concurrent distutils py3kplist pythonprefix
PYDISTUTILS_PKGNAME=	py${PORTNAME}

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.rst ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.txt ${FAKE_DESTDIR}${DOCSDIR}

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/* ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
