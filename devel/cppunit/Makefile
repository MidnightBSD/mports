PORTNAME=	cppunit
PORTVERSION=	1.15.1
CATEGORIES=	devel
MASTER_SITES=	https://dev-www.libreoffice.org/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ port of the JUnit framework for unit testing
WWW=		https://freedesktop.org/wiki/Software/cppunit

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	DOCS DOXYGEN

DOXYGEN_BUILD_DEPENDS=	doxygen:devel/doxygen \
			dot:graphics/graphviz
DOXYGEN_CONFIGURE_ENABLE=	dot doxygen html-docs
DOXYGEN_CONFIGURE_ON=	--htmldir="${DOCSDIR}/html"

USES=		libtool pathfix compiler:c++11-lang
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
OPTIONS_SUB=	yes
USE_LDCONFIG=	yes

SUB_FILES=	cppunit-config
SUB_LIST+=	DISTVERSION=${DISTVERSION}

PLIST_SUB=	VERSION=${PORTVERSION:R}

PORTDOCS=	*

post-install:
	${INSTALL_SCRIPT} ${WRKDIR}/cppunit-config ${STAGEDIR}${PREFIX}/bin/

post-install-DOCS-on:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/FAQ ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NEWS ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
