# New ports collection makefile for:	p5-Digest-HMAC
# Date created:				2001/12/11
# Whom:					nork@cityfujisawa.ne.jp
#
# $MidnightBSD: mports/security/p5-Digest-HMAC/Makefile,v 1.3 2008/05/04 10:00:23 crash Exp $
# $FreeBSD: ports/security/p5-Digest-HMAC/Makefile,v 1.6 2004/08/13 15:21:19 nork Exp $
#

PORTNAME=	Digest-HMAC
PORTVERSION=	1.01
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Digest
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
