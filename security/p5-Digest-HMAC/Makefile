# $MidnightBSD: mports/security/p5-Digest-HMAC/Makefile,v 1.5 2009/05/01 15:58:42 laffer1 Exp $

PORTNAME=	Digest-HMAC
PORTVERSION=	1.02
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to HMAC Message-Digest Algorithms
LICENSE=        perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Digest/SHA1.pm:${PORTSDIR}/security/p5-Digest-SHA1
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Digest::HMAC.3 \
		Digest::HMAC_MD5.3 \
		Digest::HMAC_SHA1.3

.include <bsd.port.mk>
