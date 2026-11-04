PORTNAME=	Cpanel-JSON-XS
PORTVERSION=	4.52
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RURBAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON::XS for Cpanel, fast and correct serialising
WWW=		https://metacpan.org/release/Cpanel-JSON-XS

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-JSON>=0:converters/p5-JSON \
		p5-JSON-XS>=0:converters/p5-JSON-XS \
		p5-Mojolicious>=6.11:www/p5-Mojolicious \
		p5-common-sense>=3.50:devel/p5-common-sense

PORTSCOUT=	limit:^[0-9\.]*$$

NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

PORTSCOUT=	limit:^[0-9\.]*$$

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Cpanel/JSON/XS/XS.so

.include <bsd.port.mk>
