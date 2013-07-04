# $MidnightBSD: mports/palm/isilo/Makefile,v 1.1 2007/01/24 20:29:12 laffer1 Exp $

PORTNAME=	isilo
PORTVERSION=	2.58
CATEGORIES=	palm textproc
MASTER_SITES=	http://mirror2.unixfreunde.de/ \
		http://freebsd.unixfreunde.de/sources/
DISTNAME=	iSiloBSD

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts documents from text/HTML to iSilo format
LICENSE=	unknown

USE_ZIP=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
ONLY_FOR_ARCHS=	i386

MAN1=		iSiloBSD.1
MANCOMPRESSED=	no
PLIST_FILES=	bin/iSiloBSD

post-extract:
	${CP} ${FILESDIR}/Makefile ${FILESDIR}/iSiloBSD.1 ${WRKDIR}

.include <bsd.port.mk>
