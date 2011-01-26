# New ports collection makefile for:		cdiff
# Date created:					September 20th 2000
# Whom:						eivind
#
# $MidnightBSD: mports/textproc/cdiff/Makefile,v 1.2 2010/01/02 19:29:59 laffer1 Exp $
# $FreeBSD: ports/textproc/cdiff/Makefile,v 1.9 2006/09/04 08:17:26 linimon Exp $
#
# This port is self contained in the src directory.
#

PORTNAME=	cdiff
PORTVERSION=	1.5
CATEGORIES=	textproc
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Diff readability enhancher for color terminals
LICENSE=	bsd3

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
USE_PERL5=	yes
MAKE_JOBS_SAFE=	yes

SRC=		${.CURDIR}/src

MAN1=		cdiff.1
PLIST_FILES=	bin/cdiff

do-fetch:
	@${DO_NADA}

do-install:
	@${INSTALL_SCRIPT} ${SRC}/cdiff.sh ${PREFIX}/bin/cdiff
	@${INSTALL_MAN} ${SRC}/cdiff.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
