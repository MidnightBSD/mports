PORTNAME=	Devel-Declare
PORTVERSION=	0.006022
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adding keywords to Perl, in Perl
WWW=		https://metacpan.org/release/Devel-Declare

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Sub-Name>=0:devel/p5-Sub-Name \
		p5-B-Hooks-EndOfScope>=0.05:devel/p5-B-Hooks-EndOfScope \
		p5-B-Hooks-OP-Check>=0.19:devel/p5-B-Hooks-OP-Check
BUILD_DEPENDS=	p5-ExtUtils-Depends>=0.302:devel/p5-ExtUtils-Depends \
		${RUN_DEPENDS}
TEST_DEPENDS=	p5-Test-Requires>0:devel/p5-Test-Requires

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Devel/Declare/Declare.so

.include <bsd.port.mk>
