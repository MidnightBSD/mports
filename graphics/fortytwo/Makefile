# $MidnightBSD$
# $FreeBSD: head/graphics/fortytwo/Makefile 390003 2015-06-17 22:44:46Z amdmi3 $

PORTNAME=	fortytwo
PORTVERSION=	0.2.0
PORTREVISION=	0
CATEGORIES=	graphics gnustep
MASTER_SITES=	SF/${PORTNAME}/FT%20%2842%29/${PORTVERSION}
DISTFILES=	FT-${PORTVERSION}-src.tgz \
		FT-${PORTVERSION}-api-ref.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph management system for GNUstep

LICENSE=	lgpl2.1

USES=		gnustep
USE_GNUSTEP=	back build

LIB_DEPENDS=	libEncore.so:${PORTSDIR}/devel/fortytwo-encore \
		libBDB.so:${PORTSDIR}/databases/fortytwo-bdb
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_BDB=	48+

WRKSRC=		${WRKDIR}/FT-${PORTVERSION}
DOCSDIR=	${GNUSTEP_PREFIX}/Local/Library/Documentation/FT

ADDITIONAL_OBJCFLAGS+=	-I${BDB_INCLUDE_DIR}
ADDITIONAL_LDFLAGS+=	-L${BDB_LIB_DIR}

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Library/Frameworks/FT.framework/Versions/0/libFT.so

.include <bsd.port.mk>
