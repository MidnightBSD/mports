PORTNAME=	Devel-Leak
PORTVERSION=	0.03
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility for looking for perl objects that are not reclaimed
WWW=		https://metacpan.org/release/Devel-Leak

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Devel/Leak/Leak.so

.include <bsd.port.mk>
