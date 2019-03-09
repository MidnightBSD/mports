# Created by: Nick Sayer <nsayer@FreeBSD.org>

PORTNAME=	Device-SerialPort
PORTVERSION=	1.040000
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/0+$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for simple serial port control

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Device/SerialPort/SerialPort.so

.include <bsd.port.mk>
