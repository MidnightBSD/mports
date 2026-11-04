PORTNAME=	Variable-Magic
PORTVERSION=	0.64
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Associate user-defined magic to variables from Perl
WWW=		https://metacpan.org/release/Variable-Magic

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Variable/Magic/Magic.so

.include <bsd.port.mk>
