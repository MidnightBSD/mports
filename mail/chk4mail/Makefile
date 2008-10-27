# New ports collection makefile for:	chk4mail
# Date created:				18 October 2002
# Whom:					johans
#
# $FreeBSD: ports/mail/chk4mail/Makefile,v 1.12 2008/10/27 20:33:42 johans Exp $
# $MidnightBSD$

PORTNAME=	chk4mail
PORTVERSION=	2.23
CATEGORIES=	mail
MASTER_SITES=	ftp://ftp.stack.nl/pub/users/johans/chk4mail/ \
		ftp://mud.stack.nl/pub/chk4mail/

MAINTAINER=	ports@Midnightbsd.org
COMMENT=	A utility to quickly check multiple folders for new email
LICENSE=        bsd2
PLIST_FILES=	bin/chk4mail bin/chkimap

MAN1=		chk4mail.1 chkimap.1

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-imap

.include <bsd.port.mk>
