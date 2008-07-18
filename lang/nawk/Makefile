# ex:ts=8
# Ports collection makefile for:  nawk
# Date created:			  29 April 1998
# Whom:				  Josh Gilliam <josh@quick.net>
#
# $MidnightBSD: mports/lang/nawk/Makefile,v 1.2 2008/05/21 04:37:34 laffer1 Exp $
# $FreeBSD: ports/lang/nawk/Makefile,v 1.33 2005/12/01 11:21:05 flz Exp $
#

PORTNAME=	nawk
PORTVERSION=	20071023
CATEGORIES=	lang
MASTER_SITES=	http://cm.bell-labs.com/cm/cs/who/bwk/
DISTNAME=	awk
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Brian Kernighan's pattern scanning and processing language

NO_WRKSUBDIR=	yes
MAKEFILE=	makefile
ALL_TARGET=	a.out
MAN1=		nawk.1
CFLAGS+=	-DHAS_ISBLANK
PLIST_FILES=	bin/nawk

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/a.out ${PREFIX}/bin/nawk
	${SED} -e 's|awk|nawk|g' ${WRKSRC}/awk.1 > ${WRKSRC}/nawk.1
	${INSTALL_MAN} ${WRKSRC}/nawk.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
