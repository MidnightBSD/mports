PORTNAME=	Term-ProgressBar
PORTVERSION=	2.23
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to display a progress bar
WWW=		https://metacpan.org/release/Term-ProgressBar

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-MethodMaker>=1.02:devel/p5-Class-MethodMaker \
		p5-Term-ReadKey>=2.14:devel/p5-Term-ReadKey
TEST_DEPENDS=	p5-Capture-Tiny>=0.13:devel/p5-Capture-Tiny \
		p5-Test-Exception>=0.31:devel/p5-Test-Exception \
		p5-Test-Warnings>=0:devel/p5-Test-Warnings

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/examples/* ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
