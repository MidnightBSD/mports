PORTNAME=	XML-XPath
PORTVERSION=	1.48
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules for parsing and evaluating XPath statements
WWW=		https://metacpan.org/release/XML-XPath

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-XML-Parser>=2.23:textproc/p5-XML-Parser
TEST_DEPENDS=	p5-Path-Tiny>=0.076:devel/p5-Path-Tiny

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
