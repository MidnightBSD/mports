PORTNAME=	IO-Compress-Lzma
PORTVERSION=	2.213
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Write lzma files / buffers
WWW=		https://metacpan.org/release/IO-Compress-Lzma

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Compress-Raw-Lzma>=${PORTVERSION}:archivers/p5-Compress-Raw-Lzma \
		p5-IO-Compress>=${PORTVERSION}:archivers/p5-IO-Compress
TEST_DEPENDS=	7z:archivers/7-zip \
		lzip:archivers/lzip \
		p5-IO-String>=0:devel/p5-IO-String \
		p5-Test-CPAN-Meta>=0:devel/p5-Test-CPAN-Meta \
		p5-Test-Pod>=1:devel/p5-Test-Pod

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
