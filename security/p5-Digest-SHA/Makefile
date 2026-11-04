PORTNAME=	Digest-SHA
PORTVERSION=	6.04
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for SHA-1/224/256/384/512
WWW=		https://metacpan.org/release/Digest-SHA

LICENSE=	artistic gpl
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-Test-Pod>=1:devel/p5-Test-Pod \
		p5-Test-Pod-Coverage>=0.08:devel/p5-Test-Pod-Coverage

USES=		perl5
USE_PERL5=	configure
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd11.4
 
post-patch:
	@${REINPLACE_CMD} -e '/EXE_FILES/d' ${WRKSRC}/Makefile.PL

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Digest/SHA/SHA.so

.include <bsd.port.mk>
