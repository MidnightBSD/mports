PORTNAME=	Data-Printer
PORTVERSION=	1.002001
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Colored pretty-print of Perl data structures and objects
WWW=		https://metacpan.org/release/Data-Printer

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-Capture-Tiny>=0:devel/p5-Capture-Tiny \
		p5-DBI>=0:databases/p5-DBI \
		p5-IO-Pty-Easy>=0:devel/p5-IO-Pty-Easy \
		p5-Test-Pod>=1.41:devel/p5-Test-Pod

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
