PORTNAME=	DateTime-Format-ISO8601
PORTVERSION=	0.08
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse ISO8601 formats

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0.18:devel/p5-DateTime \
		p5-DateTime-Format-Builder>=0.77:devel/p5-DateTime-Format-Builder

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
