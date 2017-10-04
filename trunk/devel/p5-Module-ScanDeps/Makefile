# $MidnightBSD$

PORTNAME=	Module-ScanDeps
PORTVERSION=	1.24
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Recursively scan Perl code for dependencies

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	p5-Test-Requires>=0:devel/p5-Test-Requires

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
