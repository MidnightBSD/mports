# $MidnightBSD$

PORTNAME=	paje
PORTVERSION=	1.97
PORTREVISION=	4
CATEGORIES=	science gnustep
MASTER_SITES=	SF/${PORTNAME}/Releases
DISTNAME=	Paje_${PORTVERSION}
EXTRACT_SUFX=	.tar.gz.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic visualization tool for GNUstep (Gantt chart and more)

LICENSE=	lgpl2.1

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/${DISTNAME}
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_SYSTEM_ROOT}

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DOMAIN|#GNUSTEP_INSTALLATION_DOMAIN|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Paje.app/Paje \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/AggregatingFilter.bundle/AggregatingFilter \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/ContainerFilter.bundle/ContainerFilter \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/EntityTypeFilter.bundle/EntityTypeFilter \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/FieldFilter.bundle/FieldFilter \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/FileReader.bundle/FileReader \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/General.bundle/General \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/ImbricationFilter.bundle/ImbricationFilter \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/OrderFilter.bundle/OrderFilter \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/PajeEventDecoder.bundle/PajeEventDecoder \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/PajeSimulator.bundle/PajeSimulator \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/ReductionFilter.bundle/ReductionFilter \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/SpaceTimeViewer.bundle/SpaceTimeViewer \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/StatViewer.bundle/StatViewer \
		${PREFIX}/GNUstep/System/Library/Bundles/Paje/StorageController.bundle/StorageController

.include <bsd.port.mk>
