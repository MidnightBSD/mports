PORTNAME=	Text-WordDiff
PORTVERSION=	0.09
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Track changes between documents
WWW=		https://metacpan.org/release/Text-WordDiff

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Algorithm-Diff>=0:devel/p5-Algorithm-Diff \
		p5-HTML-Parser>=0:www/p5-HTML-Parser

USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
