# ex:ts=8
# Ports collection makefile for:  raidtest
# Date created:			  Sat Oct 16, 2004
# Whom:				  David O'Brien (obrien@FreeBSD.org)
#
# $FreeBSD: ports/benchmarks/raidtest/Makefile,v 1.6 2007/05/02 07:17:21 edwin Exp $
#

PORTNAME=	raidtest
PORTVERSION=	1.1
CATEGORIES=	benchmarks
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	pjd@FreeBSD.org
COMMENT=	Test performance of storage devices

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/raidtest

do-fetch:

do-extract:
	${MKDIR} ${WRKDIR}
	${LN} -sf ${FILESDIR}/${PORTNAME}.c ${FILESDIR}/Makefile ${WRKDIR}

.include <bsd.port.mk>
