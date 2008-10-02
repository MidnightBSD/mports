# New ports collection makefile for:    zip
# Date created:		22 Dec 1994
# Whom:			ache
#
# $MidnightBSD$
# $FreeBSD: ports/archivers/zip/Makefile,v 1.38 2008/08/03 03:23:28 ache Exp $
#

PORTNAME=	zip
PORTVERSION=	3.0
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	infozip
DISTFILES=	${PORTNAME}30${EXTRACT_SUFX}
USE_ZIP=	yes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create/update ZIP files compatible with pkzip
LICENSE=	infozip

WRKSRC=		${WRKDIR}/${PORTNAME}30
MAKEFILE=	unix/Makefile
ALL_TARGET=	generic
MAN1=		zip.1 zipcloak.1 zipnote.1 zipsplit.1

do-install:
.for file in zip zipcloak zipnote zipsplit
	${INSTALL_PROGRAM} ${WRKSRC}/${file} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/${file}.1 ${PREFIX}/man/man1
.endfor

.include <bsd.port.mk>
