# $MidnightBSD$

PORTNAME=	Device-Gsm
PORTVERSION=	1.60
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl interface to GSM phones/modems on serial ports
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Device/Modem.pm:${PORTSDIR}/comms/p5-Device-Modem
RUN_DEPENDS=	${SITE_PERL}/Device/Modem.pm:${PORTSDIR}/comms/p5-Device-Modem

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
