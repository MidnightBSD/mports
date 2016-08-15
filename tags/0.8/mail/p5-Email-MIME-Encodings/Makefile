# New ports collection makefile for:	p5-Email-MIME-Encodings
# Date created:				Oct 11, 2008
# Whom:					Lucas Holt
#
# $MidnightBSD$
#

PORTNAME=	Email-MIME-Encodings
PORTVERSION=	1.313
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
