PORTNAME=	Perl-PrereqScanner-NotQuiteLite
PORTVERSION=	0.9917
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to scan your Perl code for its prerequisites
WWW=		https://metacpan.org/release/Perl-PrereqScanner-NotQuiteLite

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-ExtUtils-MakeMaker-CPANfile>=0.09:devel/p5-ExtUtils-MakeMaker-CPANfile \
		${RUN_DEPENDS}
RUN_DEPENDS=	p5-Data-Dump>=0:devel/p5-Data-Dump \
		p5-Module-CPANfile>=1.1004:devel/p5-Module-CPANfile \
		p5-Module-Find>=0:devel/p5-Module-Find \
		p5-Parse-Distname>=0:devel/p5-Parse-Distname \
		p5-Regexp-Trie>=0:devel/p5-Regexp-Trie
TEST_DEPENDS=	p5-Test-FailWarnings>=0:devel/p5-Test-FailWarnings \
		p5-Test-UseAllModules>=0.17:devel/p5-Test-UseAllModules

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
