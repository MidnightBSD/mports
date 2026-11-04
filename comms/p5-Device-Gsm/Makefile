PORTNAME=	Device-Gsm
PORTVERSION=	1.61
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl interface to GSM phones/modems on serial ports
WWW=		https://metacpan.org/release/Device-Gsm

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/Device/Modem.pm:comms/p5-Device-Modem
RUN_DEPENDS=	${SITE_PERL}/Device/Modem.pm:comms/p5-Device-Modem

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
