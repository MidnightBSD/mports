# New ports collection makefile for:	p5-Email-MIME-Encodings
# Date created:				Oct 11, 2008
# Whom:					Lucas Holt
#
# $MidnightBSD: mports/mail/p5-Email-MIME-Encodings/Makefile,v 1.1 2008/10/11 20:02:16 laffer1 Exp $
#

PORTNAME=	Email-MIME-Encodings
PORTVERSION=	1.312
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A unified interface to MIME encoding and decoding
LICENSE=	perl

RUN_DEPENDS=	p5-MIME-Base64>3.05:${PORTSDIR}/converters/p5-MIME-Base64
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Email::MIME::Encodings.3

.include <bsd.port.mk>
