PORTNAME=	XS-Parse-Keyword
PORTVERSION=	0.46
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PEVANS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XS functions to assist in parsing keyword syntax
WWW=		https://metacpan.org/dist/XS-Parse-Keyword

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-ExtUtils-CChecker>=0.11:devel/p5-ExtUtils-CChecker \
		${RUN_DEPENDS}
RUN_DEPENDS=	p5-File-ShareDir>=1.00:devel/p5-File-ShareDir
TEST_DEPENDS=	p5-Test-Simple>=1.302200:devel/p5-Test-Simple

USES=		perl5
USE_PERL5=	modbuild

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/perl5/site_perl/auto/XS/Parse/Keyword/Keyword.so

.include <bsd.port.mk>
