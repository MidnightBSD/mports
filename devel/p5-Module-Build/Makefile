PORTNAME=	Module-Build
PORTVERSION=	0.4234
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build and install Perl modules
WWW=		https://metacpan.org/release/Module-Build

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	modbuild

NO_TEST=	yes
PORTSCOUT=	skipv:0.31011,0.31012

post-patch:
	@${RM} ${WRKSRC}/bin/config_data

post-fake:
	${REINPLACE_CMD} -i '' -e 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}/usr/local/lib/perl5/site_perl/auto/Module/Build/.packlist 

.include <bsd.port.mk>
