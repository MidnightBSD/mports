# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Pod-Coverage/Makefile,v 1.13 2007/10/26 21:46:04 mat Exp $

PORTNAME=	Pod-Coverage
PORTVERSION=	0.23
CATEGORIES=	devel textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Checks if the documentation of a module is comprehensive

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Devel-Symdump>=2.01:devel/p5-Devel-Symdump
RUN_DEPENDS=	p5-Devel-Symdump>=2.01:devel/p5-Devel-Symdump

TEST_DEPENDS=	p5-Test-Pod>=1:devel/p5-Test-Pod

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

PORTDOCS=	Changes
PORTEXAMPLES=	check_installed script-covered

OPTIONS_DEFINE=	DOCS EXAMPLES

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${PORTEXAMPLES:S|^|${WRKSRC}/examples/|} ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
