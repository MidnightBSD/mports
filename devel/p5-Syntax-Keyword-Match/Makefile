PORTNAME=	Syntax-Keyword-Match
PORTVERSION=	0.15
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Match/case syntax for Perl
WWW=		https://metacpan.org/dist/Syntax-Keyword-Match

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_GPLv1+ =	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-XS-Parse-Keyword>=0.36:devel/p5-XS-Parse-Keyword
TEST_DEPENDS=	p5-Test-Simple>=1.302200:devel/p5-Test-Simple

USES=		perl5
USE_PERL5=	modbuild

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_PERL_REL}/auto/Syntax/Keyword/Match/Match.so

.include <bsd.port.mk>
