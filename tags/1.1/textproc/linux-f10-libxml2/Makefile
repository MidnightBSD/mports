# $MidnightBSD$
# $FreeBSD: ports/textproc/linux-f10-libxml2/Makefile,v 1.24 2011/03/03 09:26:43 ehaupt Exp $

PORTNAME=	libxml2
PORTVERSION=	2.7.3
PORTREVISION=	1
CATEGORIES=	textproc linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library providing XML and HTML support (Linux Fedora 10)

LICENSE=	gpl2

CONFLICTS=	linux-libxml2-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes

RPMVERSION=	1.fc10
BRANDELF_DIRS=	usr/bin
USE_LDCONFIG=	yes

PLIST_FILES=	usr/bin/xmlcatalog usr/bin/xmllint \
		usr/lib/libxml2.so.2 usr/lib/libxml2.so.${PORTVERSION} \
		usr/share/man/man1/xmlcatalog.1.gz \
		usr/share/man/man1/xmllint.1.gz usr/share/man/man3/libxml.3.gz
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	AUTHORS ChangeLog.gz Copyright NEWS README TODO
MANPREFIX=	${PREFIX}/usr/share
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
