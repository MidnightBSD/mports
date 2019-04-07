PORTNAME=	MIME-Tools
PORTVERSION=	5.509
PORTEPOCH=	2
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DSKOLL
PKGNAMEPREFIX=	p5-
DISTNAME=	MIME-tools-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of perl5 modules for MIME

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Convert-BinHex>=0:converters/p5-Convert-BinHex \
		p5-Mail-Tools>=1.05:mail/p5-Mail-Tools
TEST_DEPENDS=	p5-Test-Deep>=0:devel/p5-Test-Deep

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
