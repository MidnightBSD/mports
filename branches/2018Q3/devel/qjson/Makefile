# $MidnightBSD$

PORTNAME=	qjson
PORTVERSION=	0.8.1
CATEGORIES=	devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to manage JSON objects with Qt

LICENSE=	lgpl2.1

USE_QT4=	corelib moc_build qmake_build rcc_build uic_build
USES=		cmake tar:bzip2
USE_LDCONFIG=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,/pkgconfig,/../libdata/pkgconfig,' \
		${WRKSRC}/CMakeLists.txt

post-build:
.if ${PORT_OPTIONS:MDOCS}
	cd ${WRKSRC}/doc && doxygen
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/doc/html && ${COPYTREE_SHARE} \* ${DOCSDIR}
.endif

.include <bsd.port.mk>
