PORTNAME=	HTML-TreeBuilder-XPath
PORTVERSION=	0.14
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Add XPath support to HTML::TreeBuilder
WWW=		https://metacpan.org/release/HTML-TreeBuilder-XPath

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTML-Tree>=0:www/p5-HTML-Tree \
		p5-XML-XPathEngine>=0.12:textproc/p5-XML-XPathEngine

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
