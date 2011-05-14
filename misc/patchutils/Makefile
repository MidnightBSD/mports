# New ports collection makefile for:	patchutils
# Date created:			Oct 11, 2008
# Whom:				Lucas Holt
#
# $MidnightBSD: mports/misc/patchutils/Makefile,v 1.1 2008/10/11 20:23:35 laffer1 Exp $

PORTNAME=	patchutils
PORTVERSION=	0.3.2
CATEGORIES=	misc
MASTER_SITES=	http://cyberelk.net/tim/data/patchutils/stable/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small collection of programs that operate on patch files
LICENSE=	gpl2

USE_BZIP2=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes

MAN1=	combinediff.1 dehtmldiff.1 editdiff.1 espdiff.1 filterdiff.1 \
	fixcvsdiff.1 flipdiff.1 grepdiff.1 interdiff.1 lsdiff.1 recountdiff.1 \
	rediff.1 splitdiff.1 unwrapdiff.1

post-patch:
	@${GREP} -lR "#!/bin/bash" ${WRKSRC} | ${XARGS} ${PERL} -pi.bak -e \
		"s,#!/bin/bash,#!/bin/sh,"

.include <bsd.port.mk>
