PORTNAME=	DateTime-Format-Builder
PORTVERSION=	0.83
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create DateTime parser classes and objects
WWW=		https://metacpan.org/release/DateTime-Format-Builder

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0.12:devel/p5-DateTime \
		p5-DateTime-Format-Strptime>=1.04:devel/p5-DateTime-Format-Strptime \
		p5-Params-Validate>=0.72:devel/p5-Params-Validate \
		p5-Task-Weaken>=0:devel/p5-Task-Weaken
TEST_DEPENDS=	p5-Devel-Cycle>=1.07:devel/p5-Devel-Cycle \
		p5-Test-Memory-Cycle>=0:devel/p5-Test-Memory-Cycle

OPTIONS_DEFINE=	EXAMPLES

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

PORTEXAMPLES=	Apache.pm Fall.pm ICal.pm MySQL.pm Simple.pm Tivoli.pm W3CDTF.pm

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/examples && ${INSTALL_DATA} ${PORTEXAMPLES} ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
