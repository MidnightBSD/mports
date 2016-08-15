# $MidnightBSD$
# $FreeBSD: ports/databases/postgresql90-contrib/Makefile,v 1.2 2010/10/07 06:58:10 girgen Exp $

PORTNAME=	postgresql
PORTREVISION=	0
CATEGORIES=	databases
PKGNAMESUFFIX?=	${DISTVERSION:R:S/.//}${COMPONENT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The contrib utilities from the PostgreSQL distribution

LIB_DEPENDS=	libxslt.so:${PORTSDIR}/textproc/libxslt \
		libxml2.so:${PORTSDIR}/textproc/libxml2

USE_PGSQL=	yes
DEFAULT_PGSQL_VER=90
MASTERDIR=	${.CURDIR}/../postgresql${DEFAULT_PGSQL_VER}-server

USES+=		bison pgsql:9.0

BUILD_DIRS=	src/port contrib
INSTALL_DIRS=	contrib

SLAVE_ONLY=	yes
COMPONENT=	-contrib
CONFIGURE_ARGS+=--with-libxslt --with-libxml --with-openssl
LDFLAGS+=	-lpthread -L${PREFIX}/lib

post-install:
	@- ${INSTALL_DATA} ${WRKSRC}/contrib/README ${DOCSDIR}/contrib/README

.include "${MASTERDIR}/Makefile"
