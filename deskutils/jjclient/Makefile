# New ports collection makefile for:	jjclient
# Date created:				27 Feb 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	jjclient
PORTVERSION=	1.0
CATEGORIES=	deskutils
MASTER_SITES=	http://www.justjournal.com/software/unix/
DISTFILES=	${PORTNAME}_1.0.tar.gz

MAINTAINER=	luke@midnightbsd.org
COMMENT=	A command line client for posting JustJournal entries
LICENSE=	bsd2

LIB_DEPENDS+=	xmlrpc_client.9:${PORTSDIR}/net/xmlrpc-c

.include <bsd.port.mk>
