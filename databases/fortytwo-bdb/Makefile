# $MidnightBSD$
# $FreeBSD: head/databases/fortytwo-bdb/Makefile 390004 2015-06-17 22:44:59Z amdmi3 $

PORTNAME=	bdb
PORTVERSION=	0.2.1
PORTREVISION=	1
CATEGORIES=	databases gnustep
MASTER_SITES=	SF/fortytwo/Berkeley%20DB%20Wrapper%20%28BDB%29/${PORTVERSION}
PKGNAMEPREFIX=	fortytwo-
DISTFILES=	BDB-${PORTVERSION}-src.tgz \
		BDB-${PORTVERSION}-api-ref.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface to Berkeley DB for GNUstep

LICENSE=	lgpl2.1

USES=		gnustep
USE_GNUSTEP=	back build

LIB_DEPENDS=	libEncore.so:${PORTSDIR}/devel/fortytwo-encore
DEFAULT_LIBVERSION=	0.1
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_BDB=	43+

WRKSRC=		${WRKDIR}/BDB-${PORTVERSION}
DOCSDIR=	${GNUSTEP_PREFIX}/Local/Library/Documentation/BDB
ADDITIONAL_OBJCFLAGS+=	-I${BDB_INCLUDE_DIR} -I${GNUSTEP_PREFIX}/
ADDITIONAL_LDFLAGS+=	-L${BDB_LIB_DIR}

OPTIONS_DEFINE=	DOCS

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Library/Frameworks/BDB.framework/Versions/0/libBDB.so
	@${MKDIR} ${DOCSDIR}
	cd ${WRKDIR}/BDB-0.2.0-api-ref && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
