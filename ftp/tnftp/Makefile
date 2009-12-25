# $MidnightBSD: mports/ftp/tnftp/Makefile,v 1.1 2008/09/30 23:21:39 laffer1 Exp $

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
