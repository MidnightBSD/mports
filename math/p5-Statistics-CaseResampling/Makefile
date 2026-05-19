PORTNAME=	Statistics-CaseResampling
PORTVERSION=	0.17
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Efficient resampling and median confidence intervals
WWW=		https://metacpan.org/release/Statistics-CaseResampling

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Statistics/CaseResampling/CaseResampling.so

.include <bsd.port.mk>
