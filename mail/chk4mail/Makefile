# $MidnightBSD: mports/mail/chk4mail/Makefile,v 1.1 2008/10/27 22:04:26 crash Exp $

PORTNAME=	chk4mail
PORTVERSION=	2.24
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
