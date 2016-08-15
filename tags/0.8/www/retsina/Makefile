# New ports collection makefile for:    retsina
# Date created:                         6 January 2007
# Whom:                                 Phil Pereira <phil@bsdnexus.com>
#
# $MidnightBSD$

PORTNAME=	retsina
PORTVERSION=	1.0.1
PORTREVISION=	4
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_LOCAL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast redirector and access controller for squid
LICENSE=	bsd3

RUN_DEPENDS=	${LOCALBASE}/sbin/squid:${PORTSDIR}/www/squid
LIB_DEPENDS=	pcre:${PORTSDIR}/devel/pcre

FAKE_OPTS+=	prefixhack

GNU_CONFIGURE=	yes
CONFIGURE_ENV=  CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CPPFLAGS=	-I/usr/include -I${LOCALBASE}/include
LDFLAGS=	-L/usr/lib -L${LOCALBASE}/lib

OPTIONS=	MYSQL_DB_SUPPORT "Enable MySQL database support" off \
		PGSQL_DB_SUPPORT "Enable PostgreSQL database support" off

.include <bsd.mport.options.mk>

# Check options
.if defined(WITH_MYSQL_DB_SUPPORT)
USE_MYSQL=	yes
CONFIGURE_ARGS+=	--enable-mysql
LDFLAGS+=	-L${LOCALBASE}/lib/mysql
.endif

.if defined(WITH_PGSQL_DB_SUPPORT)
USE_PGSQL=	yes
CONFIGURE_ARGS+=	--enable-pgsql
.endif

MAN1=		retsina.1

.include <bsd.port.mk>
