PORTNAME=	XML-RPC
PORTVERSION=	1.1
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure Perl implementation for an XML-RPC client and server
WWW=		https://metacpan.org/release/XML-RPC

LICENSE=		artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-LWP-Protocol-https>0:www/p5-LWP-Protocol-https \
		p5-XML-TreePP>0:textproc/p5-XML-TreePP \
		p5-libwww>0:www/p5-libwww
RUN_DEPENDS=	p5-LWP-Protocol-https>0:www/p5-LWP-Protocol-https \
		p5-XML-TreePP>0:textproc/p5-XML-TreePP \
		p5-libwww>0:www/p5-libwww

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
