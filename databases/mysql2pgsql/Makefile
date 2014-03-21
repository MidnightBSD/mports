# $MidnightBSD$
# $FreeBSD: head/databases/mysql2pgsql/Makefile 346108 2014-02-26 06:38:36Z ehaupt $

PORTNAME=	mysql2pgsql
PORTVERSION=	1.2
CATEGORIES=	databases
MASTER_SITES=	http://pgfoundry.org/frs/download.php/1535/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.perl

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert a MySQL dump to a PostgreSQL dump
LICENSE=	bsd4

USES=		shebangfix
USE_PERL5_RUN=	yes
NO_BUILD=	yes

SHEBANG_FILES=	mysql2pgsql.perl
PLIST_FILES=	bin/mysql2pgsql

do-extract:
	${MKDIR} ${WRKSRC}
	${CP} -p ${DISTDIR}/mysql2pgsql.perl ${WRKSRC}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/mysql2pgsql.perl \
		${PREFIX}/bin/mysql2pgsql

.include <bsd.port.mk>
