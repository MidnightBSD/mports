PORTNAME=	Syntax-Keyword-Try
PORTVERSION=	0.30
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	try/catch/finally syntax for Perl
WWW=		https://metacpan.org/release/Syntax-Keyword-Try

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_GPLv1+ =	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-XS-Parse-Keyword>=0.06:devel/p5-XS-Parse-Keyword
TEST_DEPENDS=	p5-Test-Simple>=1.302200:devel/p5-Test-Simple

USES=		perl5
USE_PERL5=	modbuild

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/perl5/site_perl/auto/Syntax/Keyword/Try/Try.so

.include <bsd.port.mk>
