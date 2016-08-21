# $FreeBSD: ports/databases/postgresql-libpqxx/Makefile,v 1.22 2006/08/09 10:36:43 girgen Exp $
# $MidnightBSD$

PORTNAME=	libpqxx
PORTVERSION=	4.0.1
PORTREVISION=	2
CATEGORIES=	databases
MASTER_SITES=	http://pqxx.org/download/software/libpqxx/
PKGNAMEPREFIX=	postgresql-
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	New C++ interface for PostgreSQL

LICENSE=        bsd3

CONFLICTS=	postgresql-libpqxx-3.* postgresql-libpqxx3-3.*
PORTSCOUT=	limit:^2\.

USE_GCC=	any
USES+=		gmake libtool pgsql python:build shebangfix
USE_PGSQL=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
PLIST_SUB=	PORTVERSION=${PORTVERSION:R}
SHEBANG_FILES=	${WRKSRC}/tools/splitconfig

CONFIGURE_ARGS=	--enable-shared \
		--disable-dependency-tracking

.include <bsd.port.mk>
