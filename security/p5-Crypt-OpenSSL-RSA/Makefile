# New ports collection makefile for:    p5-Crypt-OpenSSL-RSA
# Date created:				2001/08/27
# Whom:					nork@cityfujisawa.ne.jp
#
# $MidnightBSD$
# $FreeBSD: ports/security/p5-Crypt-OpenSSL-RSA/Makefile,v 1.20 2006/11/22 07:41:46 clsung Exp $
#

PORTNAME=	Crypt-OpenSSL-RSA
PORTVERSION=	0.24
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Crypt
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to RSA encode and decode strings using OpenSSL

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Crypt/OpenSSL/Random.pm:${PORTSDIR}/security/p5-Crypt-OpenSSL-Random \
		${SITE_PERL}/${PERL_ARCH}/Crypt/OpenSSL/Bignum.pm:${PORTSDIR}/security/p5-Crypt-OpenSSL-Bignum
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Crypt::OpenSSL::RSA.3

.include <bsd.port.mk>
