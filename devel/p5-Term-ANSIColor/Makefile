PORTNAME=	Term-ANSIColor
PORTVERSION=	5.01
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Color screen output using ANSI escape sequences
WWW=		https://metacpan.org/release/Term-ANSIColor

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

OPTIONS_DEFINE=	EXAMPLES

NO_ARCH=	yes
USES=		perl5 shebangfix
USE_PERL5=	configure
SHEBANG_FILES=	examples/generate-colors

PORTEXAMPLES=	generate-colors

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/examples/generate-colors ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
