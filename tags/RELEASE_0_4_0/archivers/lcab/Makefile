# New ports collection makefile for:	LCAB
# Date created:				27 May 2005
# Whom:					Alexey Dokuchaev <danfe@FreeBSD.org>
#
# $MidnightBSD: mports/archivers/lcab/Makefile,v 1.5 2009/12/25 17:20:59 laffer1 Exp $
# $FreeBSD: ports/archivers/lcab/Makefile,v 1.2 2006/10/17 10:07:04 danfe Exp $
#

PORTNAME=	lcab
DISTVERSION=	1.0b12
CATEGORIES=	archivers
MASTER_SITES=	ftp://ohnopublishing.net/mirror/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Microsoft .CABinet file creator
LICENSE=	gpl2

MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}"
PLIST_FILES=	bin/lcab

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/lcab ${PREFIX}/bin

.include <bsd.port.mk>
