# $MidnightBSD$

PORTNAME=	sqlclient
PORTVERSION=	1.7.0
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	SQLClient-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight database abstraction layer

LICENSE=	lgpl2.1

LIB_DEPENDS=  libPerformance.so:${PORTSDIR}/devel/performance

USES=	gmake gnustep pgsql
USE_GNUSTEP=	base build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
GNU_CONFIGURE=	yes
USE_MYSQL=yes
USE_SQLITE=yes

LDFLAGS+=	-pthread
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
