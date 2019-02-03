# Created by: Graeme Cross <gcross@netspace.net.au>
# $FreeBSD: head/devel/cppunit/Makefile 378432 2015-02-04 23:43:10Z bapt $
# $MidnightBSD$

PORTNAME=	cppunit
PORTVERSION=	1.12.1
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ port of the JUnit framework for unit testing

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	DOXYGEN

USES=		libtool pathfix
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOXYGEN}
BUILD_DEPENDS+=		doxygen:${PORTSDIR}/devel/doxygen \
			dot:${PORTSDIR}/graphics/graphviz
CONFIGURE_ARGS+=	--enable-doc --enable-doxygen --enable-html-docs
PLIST_SUB+=		PORTDOCS=""
.else
CONFIGURE_ARGS+=	--disable-doc --disable-doxygen --disable-html-docs
PLIST_SUB+=		PORTDOCS="@comment "
.endif

post-install:
	${FIND} ${STAGEDIR}${PREFIX}/include/cppunit ! -type d | \
		${SED} 's,^${STAGEDIR}${PREFIX}/,,' >> ${TMPPLIST}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${FIND} ${WRKSRC}/doc/html -not -type d \
                | ${SED} 's,^${WRKSRC}/doc/html,${DOCSDIR_REL},' >> ${TMPPLIST}
	${INSTALL_MAN} ${WRKSRC}/doc/FAQ ${STAGEDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/NEWS ${STAGEDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
