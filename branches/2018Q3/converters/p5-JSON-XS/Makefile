# $MidnightBSD$

PORTNAME=	JSON-XS
PORTVERSION=	3.02
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON serialising/deserialising, done correctly and fast

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Types-Serialiser>=0:${PORTSDIR}/devel/p5-Types-Serialiser \
		p5-common-sense>0:${PORTSDIR}/devel/p5-common-sense
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes
post-patch:
# This dependency does nothing and is safe to remove
	@${REINPLACE_CMD} -e '/use Canary::Stability/d' ${WRKSRC}/Makefile.PL

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/JSON/XS/XS.so

.include <bsd.port.mk>
