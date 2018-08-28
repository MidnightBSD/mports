# $MidnightBSD$

PORTNAME=	Device-Modem
PORTVERSION=	1.56
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl class to interface generic modems (AT-compliant)
LICENSE=	perl

BUILD_DEPENDS=	p5-Device-SerialPort>=0:${PORTSDIR}/comms/p5-Device-SerialPort
RUN_DEPENDS=	p5-Device-SerialPort>=0:${PORTSDIR}/comms/p5-Device-SerialPort

PERL_CONFIGURE=	yes

post-install:
.ifndef(NOPORTEXAMPLES)
	@${ECHO_MSG} "===>   Installing examples for ${PKGNAME}"
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/examples/*.pl ${EXAMPLESDIR}
.endif

.include <bsd.port.mk>
