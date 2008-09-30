# New ports collection makefile for:	linux-curl
# Date created:		2006-08-04
# Whom:			Jose Alonso Cardenas Marquez <acm@FreeBSD.org>
#
# $FreeBSD: ports/ftp/linux-curl/Makefile,v 1.1 2006/08/04 14:38:03 acm Exp $
# $MidnightBSD: mports/ftp/linux-curl/Makefile,v 1.1 2006/12/26 02:52:37 laffer1 Exp $
#

PORTNAME=	curl
PORTVERSION=	7.13.1
CATEGORIES=	ftp linux
PKGNAMEPREFIX=	linux-
DISTNAME=	${PORTNAME}-${PORTVERSION}-5.fc4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Curl linux version
LICENSE=	mit

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
AUTOMATIC_PLIST=	yes
DESCR=	${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
