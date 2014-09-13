# New ports collection makefile for:	jjclient
# Date created:				27 Feb 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	jjclient
PORTVERSION=	1.0.2
PORTREVISION=	2
CATEGORIES=	deskutils
MASTER_SITES=	SF/justjournal/JustJournal%20UNIX%20Client/${PORTVERSION} \
		http://www.justjournal.com/software/unix/

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Command line client for posting JustJournal entries

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libxmlrpc.so:${PORTSDIR}/net/xmlrpc-c

.include <bsd.port.mk>
