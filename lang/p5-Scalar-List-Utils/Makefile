PORTNAME=	Scalar-List-Utils
PORTVERSION=	1.63
PORTEPOCH=	1
CATEGORIES=	lang perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl subroutines that would be nice to have in the perl core
WWW=		https://metacpan.org/release/Scalar-List-Utils

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/List/Util/Util.so

.include <bsd.port.mk>
