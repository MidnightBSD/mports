PORTNAME=	Test-Differences
PORTVERSION=	0.650
PORTEPOCH=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/0$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test strings and data structures for differences
WWW=		https://metacpan.org/release/Test-Differences

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Text-Diff>=1.43:textproc/p5-Text-Diff
TEST_DEPENDS=	p5-Capture-Tiny>=0.24:devel/p5-Capture-Tiny

PORTSCOUT=	skipv:0.4801

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
