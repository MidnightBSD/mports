PORTNAME=	Sys-CPU
PORTVERSION=	0.61
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for getting CPU information
WWW=		https://metacpan.org/release/MZSANFORD/Sys-CPU-0.61

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		dos2unix perl5
USE_PERL5=	configure

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Sys/CPU/CPU.so

.include <bsd.port.mk>
