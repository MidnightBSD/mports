PORTNAME=	List-MoreUtils-XS
PORTVERSION=	0.430
CATEGORIES=	lang perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide compiled List::MoreUtils functions
WWW=		https://metacpan.org/release/List-MoreUtils-XS

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/List/MoreUtils/XS/XS.so

.include <bsd.port.mk>
