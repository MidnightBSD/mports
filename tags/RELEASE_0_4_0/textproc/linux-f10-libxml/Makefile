# $MidnightBSD$
# $FreeBSD: ports/textproc/linux-f10-libxml/Makefile,v 1.21 2011/03/07 15:08:22 ehaupt Exp $

PORTNAME=	libxml
PORTVERSION=	1.8.17
CATEGORIES=	textproc linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidightBSD.org
COMMENT=	Old libXML library for Gnome-1 application compatibility (Linux Fedora 10)
LICENSE=	gpl2

CONFLICTS=	linux-libxml-[0-9]*

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	20.fc10
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libxml.so.1 usr/lib/libxml.so.${PORTVERSION}
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	AUTHORS COPYING.LIB ChangeLog README TODO
DESCR=		${.CURDIR}/../${PORTNAME}2/pkg-descr

.include <bsd.port.mk>
