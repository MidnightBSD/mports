PORTNAME=	Cpanel-JSON-XS
PORTVERSION=	4.38
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RURBAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON::XS for Cpanel, fast and correct serialising
WWW=		https://metacpan.org/release/Cpanel-JSON-XS

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

PORTSCOUT=	limit:^[0-9\.]*$$

NO_TEST=	yes
USE_PERL5=	configure
USES=		perl5

PORTSCOUT=	limit:^[0-9\.]*$$

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Cpanel/JSON/XS/XS.so

.include <bsd.port.mk>
