PORTNAME=	Test-Script
PORTVERSION=	1.25
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test::Script - Cross-platform basic tests for scripts

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Capture-Tiny>=0:devel/p5-Capture-Tiny \
		p5-Probe-Perl>=0.01:sysutils/p5-Probe-Perl
TEST_DEPENDS=	p5-Test2-Suite>=0.000060:devel/p5-Test2-Suite

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 502501
RUN_DEPENDS+=	p5-Test-Simple>=1.302015:devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
