PORTNAME=	XML-DOM
PORTVERSION=	1.46
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for building DOM Level 1 compliant document structures
WWW=		https://metacpan.org/release/XML-DOM

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-XML-Parser>=0:textproc/p5-XML-Parser \
		p5-libxml>=0:textproc/p5-libxml \
		p5-libwww>=0:www/p5-libwww \
		p5-XML-RegExp>=0:textproc/p5-XML-RegExp

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
