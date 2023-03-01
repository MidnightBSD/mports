PORTNAME=	Email-Address-XS
PORTVERSION=	1.05
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and format RFC 2822 email addresses and groups
WWW=		https://metacpan.org/release/Email-Address-XS

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Email/Address/XS/XS.so

.include <bsd.port.mk>
