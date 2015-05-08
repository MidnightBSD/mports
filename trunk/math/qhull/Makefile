# $MidnightBSD$

PORTNAME=	qhull
PORTVERSION=	2012.1
PORTREVISION=	1
CATEGORIES=	math
MASTER_SITES=	http://www.qhull.org/download/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qhull computes convex hulls, Delaunay triangulations and halfspaces

LICENSE=	other

USES=		cmake tar:tgz
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

CONFLICTS=	qhull-1.0* afni-[0-9]* qhull5-*

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} -e 's#share/man/man#man/man#g' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.mport.options.mk>

.if empty(PORT_OPTIONS:MDOCS)
EXTRA_PATCHES=	${PATCHDIR}/extra-patch-CMakeLists.txt
.endif

.include <bsd.port.mk>
