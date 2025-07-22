PORTNAME=	GD
PORTVERSION=	2.83
PORTREVISION=	0
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to Gd Graphics Library version2
WWW=		https://metacpan.org/release/GD

LICENSE=	artistic2 gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-ExtUtils-PkgConfig>=0:devel/p5-ExtUtils-PkgConfig \
		p5-File-Which>=0:sysutils/p5-File-Which
LIB_DEPENDS=	libgd.so:graphics/gd
RUN_DEPENDS=	p5-File-Which>=0:sysutils/p5-File-Which

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/GD/GD.so

.include <bsd.port.mk>
