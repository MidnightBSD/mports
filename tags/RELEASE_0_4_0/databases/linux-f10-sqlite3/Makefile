# $MidnightBSD$
# $FreeBSD: ports/databases/linux-f10-sqlite3/Makefile,v 1.7 2011/03/03 09:26:36 ehaupt Exp $

PORTNAME=	sqlite3
PORTVERSION=	3.5.9
PORTREVISION=	1
CATEGORIES=	databases linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	sqlite-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An embeddable SQL database engine (Linux Fedora 10)
LICENSE=	publicdom

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	4.fc10
BRANDELF_FILES=	usr/bin/sqlite3
USE_LDCONFIG=	yes

PLIST_FILES=	usr/bin/sqlite3 usr/lib/libsqlite3.so.0 \
		usr/lib/libsqlite3.so.0.8.6
DOCSDIR=	${PREFIX}/usr/share/doc/sqlite-${PORTVERSION}
PORTDOCS=	README
MANPREFIX=	${PREFIX}/usr/share
MAN1=		sqlite3.1
MANCOMPRESSED=	yes
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
