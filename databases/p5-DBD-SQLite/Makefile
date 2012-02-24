# $MidnightBSD: mports/databases/p5-DBD-SQLite/Makefile,v 1.5 2011/08/13 14:42:20 laffer1 Exp $

PORTNAME=	DBD-SQLite
PORTVERSION=	1.35
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@midnightbsd.org
COMMENT=	Provides access to SQLite3 databases through the DBI
LICENSE=	perl

.if defined(PACKAGE_BUILDING)
BUILD_DEPENDS=          sqlite>=3.4.1:${PORTSDIR}/databases/sqlite3
RUN_DEPENDS=            ${BUILD_DEPENDS}
SQLITE_LOCATION=        ${LOCALBASE}
.elif exists(/usr/lib/libsqlite3.a)
SQLITE_LOCATION=	/usr
CONFIGURE_ARGS+=	LIBS="-lpthread -lsqlite3"
.else
BUILD_DEPENDS=		sqlite>=3.4.1:${PORTSDIR}/databases/sqlite3
RUN_DEPENDS=		${BUILD_DEPENDS}
SQLITE_LOCATION= 	${LOCALBASE}
.endif

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	USE_LOCAL_SQLITE=0 
CONFIGURE_ARGS+=	SQLITE_LOCATION=${SQLITE_LOCATION}

MAN3=		DBD::SQLite.3 DBD::SQLite::Cookbook.3

.include <bsd.port.pre.mk>

BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI

post-patch:
	${RM} -f ${WRKSRC}/getsqlite.pl
	${PERL} -pi -e 's/\$$Config{d_usleep}/1/' ${WRKSRC}/Makefile.PL
	${PERL} -pi -e '$$_="" if m|getsqlite.pl|' ${WRKSRC}/MANIFEST

.include <bsd.port.post.mk>
