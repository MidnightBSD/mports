PORTNAME=	Data-Dumper
PORTVERSION=	2.183
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stringified perl data structures, suitable for both printing and eval
WWW=		https://metacpan.org/release/Data-Dumper

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Data/Dumper/Dumper.so

.include <bsd.port.mk>
