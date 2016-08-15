# New ports collection makefile for:	mail/p5-Email-MessageID
# Date created:				Oct 11, 2008
# Whom:					Lucas Holt
#
# $MidnightBSD$

PORTNAME=	Email-MessageID
PORTVERSION=	1.401
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate world unique message-ids
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Email/Address.pm:${PORTSDIR}/mail/p5-Email-Address
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	Email::MessageID.3

.include <bsd.port.mk>
