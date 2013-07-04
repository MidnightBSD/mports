# New ports collection makefile for:	tits
# Date created:				9 February 2001
# Whom:					Steve Woodford <scw@netbsd.hut.fi>
#
# $MidnightBSD: mports/comms/tits/Makefile,v 1.1 2007/09/01 08:30:07 laffer1 Exp $
# $FreeBSD: ports/comms/tits/Makefile,v 1.12 2007/04/09 15:43:28 des Exp $
#

PORTNAME=	tits
PORTVERSION=	1.1.2
PORTREVISION=	2
CATEGORIES=	comms
MASTER_SITES=	http://www.mctavish.co.uk/tits/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A server which provides telnet(1) access to one or more tty ports
LICENSE=	bsd4

MAKE_ENV=	BINDIR=${PREFIX}/sbin MANDIR=${PREFIX}/man/man

USE_RC_SUBR=	tits

MAN8=		tits.8
MANCOMPRESSED=	yes

post-patch:
	${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/tits.8

post-install:
	${INSTALL_DATA} ${WRKSRC}/tits.conf ${PREFIX}/etc/tits.conf.default

.include <bsd.port.mk>
