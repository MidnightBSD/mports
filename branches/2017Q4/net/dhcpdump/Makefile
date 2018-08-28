# $MidnightBSD$

PORTNAME=	dhcpdump
PORTVERSION=	1.8
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://www.mavetju.org/download/

MAINTAINER=	ports@Midnightbsd.org
COMMENT=	Decode and diagnose sniffed DHCP packets
LICENSE=        other

PLIST_FILES=	bin/dhcpdump man/man8/dhcpdump.8.gz

USE_PERL5_BUILD=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/dhcpdump ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/dhcpdump.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
