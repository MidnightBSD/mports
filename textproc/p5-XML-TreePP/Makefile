PORTNAME=	XML-TreePP
PORTVERSION=	0.43
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure Perl implementation for parsing/writing xml files
WWW=		https://metacpan.org/release/XML-TreePP

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-libwww>=5.811:www/p5-libwww
TEST_DEPENDS=	p5-HTTP-Lite>=0:www/p5-HTTP-Lite \
		p5-Tie-IxHash>=0:devel/p5-Tie-IxHash

OPTIONS_DEFINE=	EXAMPLES

USES=		perl5 shebangfix
USE_PERL5=	configure

PORTEXAMPLES=	envxml.cgi

SHEBANG_FILES=	example/envxml.cgi

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/example/envxml.cgi ${EXAMPLESDIR}

.include <bsd.port.mk>
