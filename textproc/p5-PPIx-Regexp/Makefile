PORTNAME=	PPIx-Regexp
DISTVERSION=	0.088
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:WYANT
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PPI regular expression parser
WWW=		https://metacpan.org/release/PPIx-Regexp

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-PPI>=0:textproc/p5-PPI \
		p5-Task-Weaken>=0:devel/p5-Task-Weaken

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes
PORTSCOUT=	limit:^[^_]+$$

.include <bsd.port.mk>
