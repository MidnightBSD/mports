# New ports collection makefile for:	twitter
# Date created:				24 Sept 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/deskutils/jjclient/Makefile,v 1.4 2008/07/31 18:42:07 laffer1 Exp $
#

PORTNAME=	twitter
PORTVERSION=	1.0
CATEGORIES=	deskutils
MASTER_SITES=   # none
DISTFILES=      # none

MAINTAINER=	luke@midnightbsd.org
COMMENT=	A command line client for posting to twitter
LICENSE=	bsd2

RUN_DEPENDS=	curl:${PORTSDIR}/ftp/curl
NO_BUILD=	yes

do-install:
	${INSTALL_SCRIPT} ${FILESDIR}/twitter.sh ${PREFIX}/bin/twitter

.include <bsd.port.mk>
