# New ports collection makefile for:	jjclient
# Date created:				27 Feb 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/deskutils/jjclient/Makefile,v 1.1 2008/02/27 18:58:01 laffer1 Exp $
#

PORTNAME=	jjclient
PORTVERSION=	1.0.2
CATEGORIES=	deskutils
MASTER_SITES=	http://www.justjournal.com/software/unix/
#DISTFILES=	${PORTNAME}_1.0.tar.gz

MAINTAINER=	luke@midnightbsd.org
COMMENT=	A command line client for posting JustJournal entries
LICENSE=	bsd2

LIB_DEPENDS+=	xmlrpc_client.9:${PORTSDIR}/net/xmlrpc-c

.include <bsd.port.mk>
