PORTNAME=	Math-Int128
PORTVERSION=	0.22
PORTREVISION=	5
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulate 128 bits integers in Perl
WWW=		https://metacpan.org/release/Math-Int128

LICENSE=	artistic

BUILD_DEPENDS=	p5-Math-Int64>=0.51:math/p5-Math-Int64
RUN_DEPENDS=	p5-Math-Int64>=0.51:math/p5-Math-Int64

USES=		compiler:c11 perl5
USE_PERL5=	configure

NOT_FOR_ARCHS=	armv6 i386

.include <bsd.port.pre.mk>

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Math/Int128/Int128.so

.include <bsd.port.post.mk>
