PORTNAME=	HTML-Format
PORTVERSION=	2.12
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:NIGELM
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module to format HTML to text or PS
WWW=		https://metacpan.org/release/NIGELM/HTML-Format-2.12

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Font-AFM>=0:x11-fonts/p5-Font-AFM \
		p5-HTML-Tree>=3.15:www/p5-HTML-Tree

USES=		perl5
USE_PERL5=	modbuild

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
