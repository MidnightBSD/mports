PORTNAME=	HTML-MobileJp
PORTVERSION=	0.08
PORTREVISION=	1
CATEGORIES=	japanese www perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate mobile-jp html tags
WWW=		https://metacpan.org/release/HTML-MobileJp

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTML-Parser>=0:www/p5-HTML-Parser \
		p5-Params-Validate>=0:devel/p5-Params-Validate \
		p5-URI>=0:net/p5-URI
TEST_DEPENDS=	p5-Test-Base>0:devel/p5-Test-Base \
		p5-YAML>=0:textproc/p5-YAML

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.include <bsd.port.post.mk>
