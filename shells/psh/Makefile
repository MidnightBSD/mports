PORTNAME=	psh
PORTVERSION=	1.8.1
PORTREVISION=	4
CATEGORIES=	shells perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:GREGOR

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	New shell made entirely out of a Perl script
WWW=		https://metacpan.org/release/psh

LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Term/ReadLine/Perl.pm:devel/p5-Term-ReadLine-Perl

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
