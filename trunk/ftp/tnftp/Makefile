# New ports collection makefile for:	tnftp
# Date created:				28 Jan 2004
# Whom:					Tom McLaughlin <tmclaugh@sdf.lonestar.org>
#
# $MidnightBSD$
# $FreeBSD: ports/ftp/tnftp/Makefile,v 1.10 2007/08/11 05:32:15 tmclaugh Exp $
#

PORTNAME=	tnftp
PORTVERSION=	20070806
CATEGORIES=	ftp ipv6
MASTER_SITES=	ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/ \
		ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/old/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced ftp client from NetBSD
LICENSE=	bsd4

GNU_CONFIGURE=	yes

MAN1=		tnftp.1
PLIST_FILES=	bin/tnftp

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/ftp ${PREFIX}/bin/tnftp
	${INSTALL_MAN} ${WRKSRC}/src/ftp.1 ${PREFIX}/man/man1/tnftp.1

.include <bsd.port.mk>
