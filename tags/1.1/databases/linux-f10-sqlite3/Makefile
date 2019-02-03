# $MidnightBSD$
# $FreeBSD: ports/databases/linux-f10-sqlite3/Makefile,v 1.7 2011/03/03 09:26:36 ehaupt Exp $

PORTNAME=	sqlite3
PORTVERSION=	3.5.9
PORTREVISION=	3
CATEGORIES=	databases linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	sqlite-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embeddable SQL database engine (Linux Fedora 10)

LICENSE=	publicdom

USE_LINUX=	f10
USE_LINUX_RPM=	yes

RPMVERSION=	4.fc10
BRANDELF_FILES=	usr/bin/sqlite3
USE_LDCONFIG=	yes

PLIST_FILES=	usr/bin/sqlite3 usr/lib/libsqlite3.so.0 \
		usr/lib/libsqlite3.so.0.8.6 usr/share/man/man1/sqlite3.1.gz
DOCSDIR=	${PREFIX}/usr/share/doc/sqlite-${PORTVERSION}
PORTDOCS=	README
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
