# New ports collection makefile for:	p5-DBD-SQLite
# Date created:				2002/03/30
# Whom:					nork@cityfujisawa.ne.jp
#
# $FreeBSD: ports/databases/p5-DBD-SQLite/Makefile,v 1.32 2006/09/12 13:29:00 mat Exp $
# $MidnightBSD: mports/databases/p5-DBD-SQLite/Makefile,v 1.1 2007/03/26 03:05:01 ctriv Exp $
#

PORTNAME=	DBD-SQLite
PORTVERSION=	1.13
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	DBD
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@midnightbsd.org
COMMENT=	Provides access to SQLite3 databases through the DBI
LICENSE=	perl

.if exists(/usr/lib/libsqlite3.a)
SQLITE_LOCATION=	/usr
CONFIGURE_ARGS+=	LIBS="-lpthread -lsqlite3"
.else
BUILD_DEPENDS=		sqlite>=3.3.3:${PORTSDIR}/databases/sqlite3
RUN_DEPENDS=		${BUILD_DEPENDS}
SQLITE_LOCATION= 	${LOCALBASE}
.endif

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	USE_LOCAL_SQLITE=0 
CONFIGURE_ARGS+=	SQLITE_LOCATION=${SQLITE_LOCATION}

MAN3=		DBD::SQLite.3

.include <bsd.port.pre.mk>

BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI

post-patch:
	${RM} -f ${WRKSRC}/getsqlite.pl
	${PERL} -pi -e 's/\$$Config{d_usleep}/1/' ${WRKSRC}/Makefile.PL
	${PERL} -pi -e '$$_="" if m|getsqlite.pl|' ${WRKSRC}/MANIFEST

.include <bsd.port.post.mk>
