PORTNAME=	Compress-Raw-Zlib
PORTVERSION=	2.202
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-Level Interface to zlib compression library
WWW=		https://metacpan.org/release/Compress-Raw-Zlib

LICENSE=	artistic gpl
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-Test-CPAN-Meta>=0:devel/p5-Test-CPAN-Meta \
		p5-Test-Pod>=1:devel/p5-Test-Pod

USE_PERL5=	configure
USES=		perl5

TEST_ENV=	COMPRESS_ZLIB_RUN_ALL=yes

post-patch:
	@${REINPLACE_CMD} -e '/^BUILD_ZLIB/ s|True|False|; /^INCLUDE/ s|= .*$$|= ${INCLUDEDIR}|; /^LIB/ s|= .*$$|= ${LIBDIR}|' ${WRKSRC}/config.in
	@${RM} -r ${WRKSRC}/zlib-src/

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Compress/Raw/Zlib/Zlib.so

.include <bsd.port.mk>
