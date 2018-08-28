# $MidnightBSD$

PORTNAME=	HTTP-Headers-Fast
PORTVERSION=	0.21
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for faster implementation of HTTP::Headers

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-HTTP-Date>0:www/p5-HTTP-Date
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Requires>0:devel/p5-Test-Requires

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	modbuildtiny
PERL_MODBUILD=	yes

.include <bsd.port.mk>
