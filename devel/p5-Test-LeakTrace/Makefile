PORTNAME=	Test-LeakTrace
PORTVERSION=	0.16
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Traces memory leaks
WWW=		https://metacpan.org/release/Test-LeakTrace

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Test/LeakTrace/LeakTrace.so

.include <bsd.port.mk>
