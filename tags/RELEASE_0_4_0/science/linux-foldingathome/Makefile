# $MidnightBSD: mports/biology/linux-foldingathome/Makefile,v 1.3 2008/04/25 03:59:28 ctriv Exp $

PORTNAME=	foldingathome
PORTVERSION=	5.04
CATEGORIES=	science biology
MASTER_SITES=	http://www.stanford.edu/group/pandegroup/release/
PKGNAMEPREFIX=	linux-
DISTNAME=	FAH${PORTVERSION:S/.//}-Linux
EXTRACT_SUFX=	.exe

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed client for Protein Folding
LICENSE=        unknown

USE_LINUX=	yes
ONLY_FOR_ARCHS=	i386 amd64

PLIST_FILES=	share/${PORTNAME}/${DISTNAME}${EXTRACT_SUFX} \
		bin/FoldingAtHome
PLIST_DIRS=	share/${PORTNAME}

SUB_FILES=	FoldingAtHome
SUB_LIST=	BINNAME=${DISTNAME}${EXTRACT_SUFX}

do-extract:
	@${MKDIR} ${WRKSRC}
	@${CP} ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ${WRKSRC}

do-build:
	${BRANDELF} -t Linux ${WRKSRC}/${DISTNAME}${EXTRACT_SUFX}

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/FoldingAtHome ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/${DISTNAME}${EXTRACT_SUFX} ${DATADIR}/

.include <bsd.port.mk>
