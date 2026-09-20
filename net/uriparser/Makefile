PORTNAME=	uriparser
DISTVERSION=	1.0.2
CATEGORIES=	net
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/${PORTNAME}-${DISTVERSION}/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${DISTNAME}-doc.zip \
		${DISTNAME}-doc.qch
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX} \
		${DISTNAME}-doc.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	URI parsing library
WWW=		https://github.com/uriparser/uriparser

LICENSE=	Apache-2.0 bsd3 lgpl2.1+
LICENSE_COMB=	multi
LICENSE_FILE_Apache-2.0=	${WRKSRC}/COPYING.Apache-2.0
LICENSE_FILE_bsd3=	${WRKSRC}/COPYING.BSD-3-Clause
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/COPYING.LGPL-2.1

TEST_DEPENDS=	googletest>=1.10.0:devel/googletest

USES=		cmake:noninja,testing cpe pathfix tar:xz
CPE_VENDOR=	uriparser_project
USE_LDCONFIG=	yes

CMAKE_OFF=	URIPARSER_BUILD_DOCS URIPARSER_BUILD_TESTS
CMAKE_TESTING_ON=	URIPARSER_BUILD_TESTS

PLIST_SUB=	DISTVERSION=${DISTVERSION}
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/qch
	(cd ${WRKDIR}/${DISTNAME}-doc && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR})
	${INSTALL_MAN} ${DISTDIR}/${DISTNAME}-doc.qch ${FAKE_DESTDIR}${DOCSDIR}/qch

.include <bsd.port.mk>
