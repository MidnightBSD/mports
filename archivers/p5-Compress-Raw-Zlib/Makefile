PORTNAME=	Compress-Raw-Zlib
PORTVERSION=	2.213
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-Level Interface to zlib compression library
WWW=		https://metacpan.org/release/Compress-Raw-Zlib

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USE_PERL5=	configure
USES=		perl5

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^BUILD_ZLIB/ s|True|False|; /^INCLUDE/ s|= .*$$|= ${INCLUDEDIR}|; /^LIB/ s|= .*$$|= ${LIBDIR}|' ${WRKSRC}/config.in
	@${RM} -r ${WRKSRC}/zlib-src/

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Compress/Raw/Zlib/Zlib.so

.include <bsd.port.mk>
