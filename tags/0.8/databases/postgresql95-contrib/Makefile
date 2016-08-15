# Created by: Palle Girgensohn <girgen@pingpong.net>
# $FreeBSD: head/databases/postgresql95-contrib/Makefile 406034 2016-01-13 10:36:22Z girgen $
# $MidnightBSD$

PORTNAME=	postgresql
PORTREVISION=	0
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The contrib utilities from the PostgreSQL distribution

LIB_DEPENDS=	libxslt.so:${PORTSDIR}/textproc/libxslt \
		libxml2.so:${PORTSDIR}/textproc/libxml2

MASTERDIR=	${.CURDIR}/../postgresql95-server

USES=		bison pgsql:9.5

BUILD_DIRS=	src/port src/common contrib
INSTALL_DIRS=	contrib

SLAVE_ONLY=	yes
COMPONENT=	-contrib
CONFIGURE_ARGS+=--with-libxslt --with-libxml --with-openssl --disable-nls --with-uuid=bsd
LDFLAGS+=	-lpthread -L${PREFIX}/lib

post-install:
	@- ${INSTALL_DATA} ${WRKSRC}/contrib/README ${STAGEDIR}${DOCSDIR}/extension/README

.include "${MASTERDIR}/Makefile"
