# New ports collection makefile for:	p5-Device-Gsm
# Date created:				09 May 2006
# Whom:					Anders Nordby <anders@FreeBSD.org>
#
# $MidnightBSD: mports/comms/p5-Device-Gsm/Makefile,v 1.1 2008/08/18 16:22:41 laffer1 Exp $
# $FreeBSD: ports/comms/p5-Device-Gsm/Makefile,v 1.5 2008/04/17 14:24:13 araujo Exp $
#

PORTNAME=	Device-Gsm
PORTVERSION=	1.55
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl interface to GSM phones/modems on serial ports
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Device/Modem.pm:${PORTSDIR}/comms/p5-Device-Modem
RUN_DEPENDS=	${SITE_PERL}/Device/Modem.pm:${PORTSDIR}/comms/p5-Device-Modem

PERL_CONFIGURE=	yes

MAN3=		Device::Gsm::Sms.3 Device::Gsm::Pdu.3 Device::Gsm.3

.include <bsd.port.mk>
