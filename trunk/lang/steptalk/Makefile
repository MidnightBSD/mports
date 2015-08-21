# $MidnightBSD$

PORTNAME=	steptalk
PORTVERSION=	0.10.0
CATEGORIES=	lang gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	StepTalk-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The official GNUstep scripting framework
LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	gui build
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/StepTalk
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}
GDL2_PORT?=	databases/gdl2

.if !defined(STEPTALK_WITHOUT_GDL2)
USE_GNUSTEP_LOCAL_LIBS+=	EOInterface:${GDL2_PORT}
PLIST_SUB+=	WITH_GDL2=""

post-configure:
	${REINPLACE_CMD} -e 's|-lgnustep-db2|-lEOAccess|' \
		 -e 's|-lgnustep-db2control|-lEOControl|' \
		 -e 's|-lgnustep-db2modeler|-lEOModeler|' \
		${WRKSRC}/Modules/GDL2/GNUmakefile
.else
PLIST_SUB+=	WITH_GDL2="@comment "

post-configure:
	${REINPLACE_CMD} -e 's|bundle.make|rules.make|' \
		${WRKSRC}/Modules/GDL2/GNUmakefile
.endif

.include <bsd.port.mk>
