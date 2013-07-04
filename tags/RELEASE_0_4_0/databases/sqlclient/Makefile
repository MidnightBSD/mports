# $MidnightBSD: mports/databases/sqlclient/Makefile,v 1.4 2008/04/11 21:36:04 laffer1 Exp $

PORTNAME=	sqlclient
PORTVERSION=	1.5.3
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	SQLClient-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight database abstraction layer
LICENSE=	lgpl

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	Performance:devel/performance
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_PGSQL=yes
USE_MYSQL=yes
USE_SQLITE=yes

CFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}
DEFAULT_LIBVERSION=	1.5
DEFAULT_LIBVERSION2=	1.5.0
PLIST_SUB+=	LIBVERSION2=${DEFAULT_LIBVERSION2}
PLIST_SUB+=	MAJORLIBVERSION2=${DEFAULT_LIBVERSION2:C/([0-9]).*/\1/1}


pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/ECPG.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/ECPG_libs.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/Postgres.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/Postgres_libs.bundle/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/SQLite.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Bundles/SQLClient/SQLite_libs.bundle/Resources/
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/Local/Library/Libraries/

.include <bsd.port.mk>
