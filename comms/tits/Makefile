PORTNAME=	tits
PORTVERSION=	1.3.0
CATEGORIES=	comms
MASTER_SITES=	http://www.mctavish.co.uk/tits/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	server which provides telnet(1) access to one or more tty ports

LICENSE=	bsd4

USES=		uidfix
USE_RC_SUBR=	tits

MAKE_ENV=	BINDIR=${PREFIX}/sbin MANDIR=${PREFIX}/share/man/man

post-patch:
	${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/tits.8

post-install:
	${INSTALL_DATA} ${WRKSRC}/tits.conf \
		${PREFIX}/etc/tits.conf.default

.include <bsd.port.mk>
