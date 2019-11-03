PORTNAME=	DateTime-Calendar-Mayan
PORTVERSION=	0.0601
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mayan Long Count, Haab, and Tzolkin calendars

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0:devel/p5-DateTime \
		p5-Params-Validate>=0:devel/p5-Params-Validate

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
