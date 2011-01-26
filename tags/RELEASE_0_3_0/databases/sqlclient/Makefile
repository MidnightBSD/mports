# New ports collection makefile for:	sqlclient
# Date created:         28 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/databases/sqlclient/Makefile,v 1.1 2006/10/31 06:10:09 dinoex Exp $
# $MidnightBSD: mports/databases/sqlclient/Makefile,v 1.3 2007/11/07 20:20:10 ctriv Exp $
#

PORTNAME=	sqlclient
PORTVERSION=	1.3.0
PORTREVISION=	0
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	SQLClient-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight database abstraction layer
LICENSE=	lgpl

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
ALL_TARGET=
LDCONFIG_DIRS=	${LOCALLIBDIR}
USE_LDCONFIG=	yes

USE_GNUSTEP_LDCONFIG= ${GNUSTEP_LOCAL_LIBRARIES}
USE_GNUSTEP_LOCAL_LIBS+=	Performance:${PERFORMANCE_PORT}
PERFORMANCE_PORT?=	devel/performance
USE_PGSQL=yes
USE_MYSQL=yes
USE_SQLITE=yes
CFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}

CONFIGURE_ARGS+=	--with-additional-lib="${PTHREAD_LIBS}"
ADDITIONAL_LDFLAGS+=	-L${LOCALBASE}/lib -L${LOCALBASE}/GNUstep/Local/Library/Libraries
MAKE_ENV+=	ADDITIONAL_LDFLAGS="${ADDITIONAL_LDFLAGS}"

ADDITIONAL_LIB_DIRS+=	-L${LOCLABASE}/lib
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}
DEFAULT_LIBVERSION=	1.3


pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/ECPG.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/ECPG_libs.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/Postgres.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/Postgres_libs.bundle/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/SQLite.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/SQLite_libs.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Libraries/

.include <bsd.port.mk>
