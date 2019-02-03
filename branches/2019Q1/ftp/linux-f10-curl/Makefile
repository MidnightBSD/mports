# $MidnightBSD$
# $FreeBSD: ports/ftp/linux-f10-curl/Makefile,v 1.14 2011/03/03 09:26:38 ehaupt Exp $

PORTNAME=	curl
PORTVERSION=	7.19.6
PORTREVISION=	2
CATEGORIES=	ftp linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTFILES=	curl-${PORTVERSION}-${RPMVERSION}.i386.rpm \
		libcurl-${PORTVERSION}-${RPMVERSION}.i386.rpm

MAINTAINER=	emulation@FreeBSD.org
COMMENT=	Command line tool for transferring files with URL syntax (Linux Fedora 10)

LICENSE=	mit

CONFLICTS=	linux-curl-[0-9]* 

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	cyrus-sasl2 openldap

RPMVERSION=	2.fc10
USE_LDCONFIG=	yes
BRANDELF_FILES=	usr/bin/curl
DESCR=	${.CURDIR}/../${PORTNAME}/pkg-descr

PLIST_FILES=	usr/bin/curl usr/lib/libcurl.so.4 usr/lib/libcurl.so.4.1.1 \
		usr/share/man/man1/curl.1.gz
DOCSDIR=	usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	BUGS COPYING FEATURES README TODO CHANGES FAQ MANUAL RESOURCES TheArtOfHttpScripting

.if defined(PACKAGE_BUILDING)
SRC_DISTFILES=	curl-${PORTVERSION}-${RPMVERSION}.src.rpm
ALWAYS_KEEP_DISTFILES=	YES
.endif

.include <bsd.port.mk>
