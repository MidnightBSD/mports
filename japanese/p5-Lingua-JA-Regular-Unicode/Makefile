PORTNAME=	Lingua-JA-Regular-Unicode
PORTVERSION=	0.13
CATEGORIES=	japanese perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to convert Japanese chars
WWW=		https://metacpan.org/release/Lingua-JA-Regular-Unicode

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	p5-Text-TestBase>=0:textproc/p5-Text-TestBase

USES=		perl5
USE_PERL5=	modbuildtiny

NO_ARCH=	yes

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.include <bsd.port.post.mk>
