PORTNAME=	Function-Parameters
PORTVERSION=	2.002004
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MAUKE
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Subroutine definitions with parameter lists
WWW=		https://metacpan.org/release/Function-Parameters

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

PORTSCOUT=	limit:^[0-9\.]*$$

# magus circular
NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Function/Parameters/Parameters.so

.include <bsd.port.mk>
