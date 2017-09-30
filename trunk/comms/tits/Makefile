# $MidnightBSD$

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

post-patch:
	${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/tits.8

post-install:
	${INSTALL_DATA} ${WRKSRC}/tits.conf ${PREFIX}/etc/tits.conf.default

.include <bsd.port.mk>
