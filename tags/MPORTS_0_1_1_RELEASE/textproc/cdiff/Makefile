# New ports collection makefile for:		cdiff
# Date created:					September 20th 2000
# Whom:						eivind
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/cdiff/Makefile,v 1.9 2006/09/04 08:17:26 linimon Exp $
#
# This port is self contained in the src directory.
#

PORTNAME=	cdiff
PORTVERSION=	1.4
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Diff readability enhancher for color terminals

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
USE_PERL5=	yes

SRC=		${.CURDIR}/src

MAN1=		cdiff.1
PLIST_FILES=	bin/cdiff

do-fetch:
	@${DO_NADA}

do-install:
	@${INSTALL_SCRIPT} ${SRC}/cdiff.sh ${PREFIX}/bin/cdiff
	@${INSTALL_MAN} ${SRC}/cdiff.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
