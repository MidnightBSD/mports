# New ports collection makefile for:	mail/p5-Email-MessageID
# Date created:				Oct 11, 2008
# Whom:					Lucas Holt
#
# $MidnightBSD$

PORTNAME=	Email-MessageID
PORTVERSION=	1.406
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate world unique message-ids

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/Email/Address.pm:mail/p5-Email-Address
RUN_DEPENDS=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
