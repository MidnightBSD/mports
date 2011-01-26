# New ports collection makefile for:	PostgreSQL Pgaccess
# Date created:		December 1st, 2002
# Whom:			Palle Girgensohn <girgen@pingpong.net>
#
# $FreeBSD: ports/databases/postgresql-libpqxx/Makefile,v 1.22 2006/08/09 10:36:43 girgen Exp $
# $MidnightBSD: mports/databases/postgresql-libpqxx/Makefile,v 1.4 2008/05/10 17:50:28 crash Exp $
#

PORTNAME=	libpqxx
PORTVERSION=	2.6.9
CATEGORIES=	databases
MASTER_SITES=	http://pqxx.org/download/%SUBDIR%/
MASTER_SITE_SUBDIR=	software/libpqxx
PKGNAMEPREFIX=	postgresql-
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A new C++ interface for PostgreSQL
LICENSE=        gpl2

USE_PGSQL=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
PLIST_SUB=	PORTVERSION=${PORTVERSION}

CONFIGURE_ARGS=	--with-postgres=${LOCALBASE} \
		--enable-shared \
		--with-postgres-include=${LOCALBASE}/include/postgresql

.include <bsd.port.mk>
