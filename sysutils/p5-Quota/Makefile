PORTNAME=	Quota
PORTVERSION=	1.8.2
CATEGORIES=	sysutils perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module that provides access to filesystem quotas
WWW=		https://metacpan.org/release/Quota

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

pre-configure:
	${LN} -sf ${WRKSRC}/hints/bsd.h ${WRKSRC}/myconfig.h

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Quota/Quota.so

.include <bsd.port.mk>
