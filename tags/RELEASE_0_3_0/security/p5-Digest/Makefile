# $MidnightBSD: mports/security/p5-Digest/Makefile,v 1.2 2009/05/01 15:57:51 laffer1 Exp $ 

PORTNAME=	Digest
PORTVERSION=	1.16
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules that calculate message digests
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Digest.3 Digest::base.3 Digest::file.3

.include <bsd.port.mk>
