PORTNAME=	CGI
PORTVERSION=	4.40
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handle Common Gateway Interface requests and responses

LICENSE=	artistic2 gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-HTML-Parser>=3.69:www/p5-HTML-Parser
RUN_DEPENDS=	p5-HTML-Parser>=3.69:www/p5-HTML-Parser
TEST_DEPENDS=	p5-Test-Deep>=0:devel/p5-Test-Deep \
		p5-Test-NoWarnings>=0:devel/p5-Test-NoWarnings \
		p5-Test-Warn>=0:devel/p5-Test-Warn

CONFLICTS_INSTALL=	p5-CGI.pm-[1-3]*

PORTSCOUT=	limit:^[0-9\.]*$$

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
