PORTNAME=	URI
PORTVERSION=	5.36
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:OALDERS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to Uniform Resource Identifier (URI) references
WWW=		https://metacpan.org/release/URI

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	p5-MIME-Base32>=0:converters/p5-MIME-Base32
TEST_DEPENDS=	p5-Test-Needs>=0:devel/p5-Test-Needs \
		p5-Test-Warnings>=0:devel/p5-Test-Warnings

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
.include <bsd.port.mk>
