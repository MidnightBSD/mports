PORTNAME=	Sereal-Decoder
PORTVERSION=	5.004
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:YVES
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for fast, powerful binary deserialization (decoder)
WWW=		https://metacpan.org/pod/Sereal::Decoder

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

LIB_DEPENDS=	libzstd.so:archivers/zstd
TEST_DEPENDS=	p5-Test-Deep>=0:devel/p5-Test-Deep \
		p5-Test-Differences>=0,1:devel/p5-Test-Differences \
		p5-Test-LongString>=0:devel/p5-Test-LongString \
		p5-Test-Warn>=0:devel/p5-Test-Warn

USES=		perl5
USE_PERL5=	configure

CONFIGURE_ENV=	NO_ASM=no USE_UNALIGNED=no
MAKE_ENV=	PASTHRU_DEFINE="-I${LOCALBASE}/include"
MAKE_JOBS_UNSAFE=	yes

PORTSCOUT=	limit:^[0-9\.]*$$

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Sereal/Decoder/Decoder.so

.include <bsd.port.mk>
