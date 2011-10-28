# New ports collection makefile for:	jjclient
# Date created:				27 Feb 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/deskutils/jjclient/Makefile,v 1.6 2010/05/16 18:14:01 laffer1 Exp $
#

PORTNAME=	jjclient
PORTVERSION=	1.0.2
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	SF/justjournal/JustJournal%20UNIX%20Client/${PORTVERSION} \
		http://www.justjournal.com/software/unix/

MAINTAINER=	luke@midnightbsd.org
COMMENT=	A command line client for posting JustJournal entries
LICENSE=	bsd2

LIB_DEPENDS=	xmlrpc_client.3:${PORTSDIR}/net/xmlrpc-c

.include <bsd.port.mk>
