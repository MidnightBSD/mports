# New ports collection makefile for:	p5-Device-Modem
# Date created:				22 July 2003
# Whom:					Anders Nordby <anders@FreeBSD.org>
#
# $MidnightBSD: mports/comms/p5-Device-Modem/Makefile,v 1.1 2008/08/18 16:20:49 laffer1 Exp $
# $FreeBSD: ports/comms/p5-Device-Modem/Makefile,v 1.10 2008/04/17 14:24:14 araujo Exp $
#

PORTNAME=	Device-Modem
PORTVERSION=	1.51
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl class to interface generic modems (AT-compliant)
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Device/SerialPort.pm:${PORTSDIR}/comms/p5-Device-SerialPort
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Device::Modem.3 Device::Modem::Log::File.3 \
		Device::Modem::Log::Syslog.3 Device::Modem::Protocol::Xmodem.3 \
		Device::Modem::UsRobotics.3

post-install:
.ifndef(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing examples for ${PKGNAME}"
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/examples/*.pl ${EXAMPLESDIR}
.endif

.include <bsd.port.mk>
