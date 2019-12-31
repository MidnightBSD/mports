PORTNAME=	IO-Compress
PORTVERSION=	2.087
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 compression modules (bzip2, deflate, gzip, zlib, zip)

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Compress-Raw-Bzip2>=${PORTVERSION}:archivers/p5-Compress-Raw-Bzip2 \
		p5-Compress-Raw-Zlib>=${PORTVERSION}:archivers/p5-Compress-Raw-Zlib
TEST_DEPENDS=	p5-Test-Pod>=1:devel/p5-Test-Pod

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

post-patch:
	@${REINPLACE_CMD} -e '/EXE_FILES/d' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
