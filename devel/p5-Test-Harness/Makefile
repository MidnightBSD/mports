PORTNAME=	Test-Harness
PORTVERSION=	3.48
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run perl standard test scripts with statistics
WWW=		https://metacpan.org/release/Test-Harness

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5:patch,build,run
USE_PERL5=	configure

PLIST_SUB=	P5_PREFIX="p5"

pre-patch:
	@${MV} ${WRKSRC}/bin/prove ${WRKSRC}/bin/p5prove

post-patch:
	@${REINPLACE_CMD} -e '/INSTALLDIRS/d' ${WRKSRC}/${CONFIGURE_SCRIPT}
	@${REINPLACE_CMD} 's|bin/prove|bin/p5prove|' ${WRKSRC}/MANIFEST ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
