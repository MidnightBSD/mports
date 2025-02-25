PORTNAME=	POE-API-Peek
DISTVERSION=	2.20
PORTEPOCH=	2
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:BINGOS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Peek into the internals of a running POE environment
WWW=		https://metacpan.org/release/POE-API-Peek

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-POE>=1.311:devel/p5-POE \
		p5-Devel-Size>0:devel/p5-Devel-Size

USES=		perl5
USE_PERL5=	configure
INSTALL_TARGET=	pure_install

.include <bsd.port.mk>
