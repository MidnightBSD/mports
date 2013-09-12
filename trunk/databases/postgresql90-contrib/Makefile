# $MidnightBSD$
# $FreeBSD: ports/databases/postgresql90-contrib/Makefile,v 1.2 2010/10/07 06:58:10 girgen Exp $

PORTNAME=	postgresql
PORTREVISION=	0
CATEGORIES=	databases
PKGNAMESUFFIX=	-contrib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The contrib utilities from the PostgreSQL distribution

LIB_DEPENDS=	xslt.2:${PORTSDIR}/textproc/libxslt \
		xml2.5:${PORTSDIR}/textproc/libxml2

USE_PGSQL=	yes
DEFAULT_PGSQL_VER=90
MASTERDIR=	${.CURDIR}/../postgresql${DEFAULT_PGSQL_VER}-server

USE_BISON=	build

BUILD_DIRS=	src/port contrib
INSTALL_DIRS=	contrib

SLAVE_ONLY=	yes
CONFIGURE_ARGS+=--with-libxslt --with-libxml --with-openssl
LDFLAGS+=	${PTHREAD_LIBS} -L${PREFIX}/lib

OPTIONS_DEFINE=	OSSP_UUID
OSSP_UUID_DESC=	Enable / disable ossp-uuid support
OPTIONS_DEFAULT=	OSSP_UUID

post-install:
	@- ${INSTALL_DATA} ${WRKSRC}/contrib/README ${DOCSDIR}/contrib/README

.include "${MASTERDIR}/Makefile"
