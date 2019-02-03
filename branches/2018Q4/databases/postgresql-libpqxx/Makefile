# $FreeBSD: ports/databases/postgresql-libpqxx/Makefile,v 1.22 2006/08/09 10:36:43 girgen Exp $
# $MidnightBSD$

PORTNAME=	libpqxx
PORTVERSION=	6.1.0
CATEGORIES=	databases
PKGNAMEPREFIX=	postgresql-
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	New C++ interface for PostgreSQL

LICENSE=        bsd3

CONFLICTS=	postgresql-libpqxx-[1-5].* postgresql-libpqxx3-3.* \
		postgresql-libpqxx4-4.*

USES=		compiler:c++11-lang gmake libtool pathfix pgsql python:2.7,build shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	jtv
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
SHEBANG_FILES=	${WRKSRC}/tools/splitconfig
INSTALL_TARGET=	install-strip
PLIST_SUB=	PORTVERSION=${PORTVERSION:R}

CONFIGURE_ARGS=	--enable-shared \
		--disable-dependency-tracking

.include <bsd.port.mk>
