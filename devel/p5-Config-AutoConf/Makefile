PORTNAME=	Config-AutoConf
PORTVERSION=	0.320
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to implement some of AutoConf macros
WWW=		https://metacpan.org/release/Config-AutoConf

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_artistic=	${WRKSRC}/ARTISTIC-1.0
LICENSE_FILE_gpl+ =	${WRKSRC}/GPL-1

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Capture-Tiny>=0:devel/p5-Capture-Tiny

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
