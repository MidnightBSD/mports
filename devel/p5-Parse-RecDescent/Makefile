PORTNAME=	Parse-RecDescent
PORTVERSION=	1.967015
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Recursive descent parsing framework for Perl
WWW=		https://metacpan.org/release/Parse-RecDescent

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-Test-Warn>=0:devel/p5-Test-Warn

OPTIONS_DEFINE=	DOCS

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/tutorial/* ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
