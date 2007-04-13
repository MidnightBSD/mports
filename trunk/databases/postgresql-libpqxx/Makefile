# New ports collection makefile for:	PostgreSQL Pgaccess
# Date created:		December 1st, 2002
# Whom:			Palle Girgensohn <girgen@pingpong.net>
#
# $FreeBSD: ports/databases/postgresql-libpqxx/Makefile,v 1.22 2006/08/09 10:36:43 girgen Exp $
# $MidnightBSD: mports/databases/postgresql-libpqxx/Makefile,v 1.1 2007/01/20 15:50:31 laffer1 Exp $
#

PORTNAME=	libpqxx
PORTVERSION=	2.6.7
CATEGORIES=	databases
MASTER_SITES=	ftp://thaiopensource.org/%SUBDIR%/
MASTER_SITE_SUBDIR=	software/libpqxx
PKGNAMEPREFIX=	postgresql-
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A new C++ interface for PostgreSQL

USE_PGSQL=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes
PLIST_SUB=	PORTVERSION=${PORTVERSION}

CONFIGURE_ARGS=	--with-postgres=${LOCALBASE} \
		--enable-shared \
		--with-postgres-include=${LOCALBASE}/include/postgresql

.include <bsd.port.mk>
