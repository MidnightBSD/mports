PORTNAME=	Module-CPANTS-Analyse
PORTVERSION=	1.02
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate Kwalitee ratings for a distribution
WWW=		https://metacpan.org/release/Module-CPANTS-Analyse

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-ExtUtils-MakeMaker-CPANfile>=0.06:devel/p5-ExtUtils-MakeMaker-CPANfile \
		${RUN_DEPENDS}
RUN_DEPENDS=	p5-Archive-Any-Lite>=0.06:archivers/p5-Archive-Any-Lite \
		p5-Array-Diff>=0.04:misc/p5-Array-Diff \
		p5-Class-Accessor>=0.19:devel/p5-Class-Accessor \
		p5-Data-Binary>=0:devel/p5-Data-Binary \
		p5-File-Find-Object>=0.2.1:devel/p5-File-Find-Object \
		p5-Module-Find>=0:devel/p5-Module-Find \
		p5-Parse-Distname>=0:devel/p5-Parse-Distname \
		p5-Perl-PrereqScanner-NotQuiteLite>=0.9901:devel/p5-Perl-PrereqScanner-NotQuiteLite \
		p5-Software-License>=0.103012:misc/p5-Software-License
TEST_DEPENDS=	p5-Test-FailWarnings>=0:devel/p5-Test-FailWarnings

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
