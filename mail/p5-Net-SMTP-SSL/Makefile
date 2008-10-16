# New ports collection makefile for:	p5-Net-SMTP-SSL
# Date created:		June 22, 2008
# Whom:			Wesley Shields <wxs@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/mail/p5-Net-SMTP-SSL/Makefile,v 1.1 2008/06/22 22:45:10 wxs Exp $
#

PORTNAME=	Net-SMTP-SSL
PORTVERSION=	1.01
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An SMTP client supporting SSL
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/IO/Socket/SSL.pm:${PORTSDIR}/security/p5-IO-Socket-SSL

PERL_CONFIGURE=	yes

MAN3=		Net::SMTP::SSL.3

.include <bsd.port.mk>
