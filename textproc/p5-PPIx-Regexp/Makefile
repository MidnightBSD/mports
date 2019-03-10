# Created by: Ashish SHUKLA <wahjava@gmail.com>

PORTNAME=	PPIx-Regexp
PORTVERSION=	0.062
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:WYANT
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PPI regular expression parser

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-PPI>=1.117:textproc/p5-PPI

PORTSCOUT=	limit:^[^_]+$$

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
