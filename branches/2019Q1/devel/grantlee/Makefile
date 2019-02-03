# $MidnightBSD$
# $FreeBSD: ports/devel/grantlee/Makefile,v 1.1 2011/02/06 15:30:19 fluffy Exp $

PORTNAME=	grantlee
DISTVERSION=	0.3.0
CATEGORIES=	devel
MASTER_SITES=	http://downloads.${PORTNAME}.org/ \
		http://www.loegria.net/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	String template engine for Qt4
LICENSE=	lgpl2.1

USE_QT4=	corelib gui qtestlib_build script \
		qmake_build moc_build rcc_build uic_build
USES=		cmake:outsource
CMAKE_ARGS+=	-DBUILD_TESTS:BOOL=FALSE
MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOXYGEN

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOXYGEN}
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen \
		dot:${PORTSDIR}/graphics/graphviz
PORTDOCS=	*

post-install:
	${MKDIR} ${DOCSDIR}
	cd ${BUILD_WRKSRC} && ${MAKE} docs
	cd ${BUILD_WRKSRC}/apidox && ${COPYTREE_SHARE} \* ${DOCSDIR}
.endif

.include <bsd.port.mk>
