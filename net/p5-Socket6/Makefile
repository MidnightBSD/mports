PORTNAME=	Socket6
PORTVERSION=	0.29
PORTREVISION=	2
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPv6 related part of the C socket.h defines and structure manipulators
WWW=		https://metacpan.org/release/Socket6

LICENSE=	bsd3

USES=		perl5
USE_PERL5=	configure

PLIST_FILES=	%%PERL5_MAN3%%/Socket6.3.gz \
		%%SITE_PERL%%/%%PERL_ARCH%%/Socket6.pm \
		%%SITE_PERL%%/%%PERL_ARCH%%/auto/Socket6/Socket6.so
PLIST_DIRS=	%%SITE_PERL%%/%%PERL_ARCH%%/auto/Socket6

.include <bsd.port.mk>
