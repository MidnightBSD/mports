PORTNAME=	Mojo-IOLoop-Delay
PORTVERSION=	8.76
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:JBERGER
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flow-control helpers for Mojo::Promise
WWW=		https://metacpan.org/release/Mojo-IOLoop-Delay

LICENSE=	artistic2

BUILD_DEPENDS=	p5-Module-Build-Tiny>0:devel/p5-Module-Build-Tiny
RUN_DEPENDS=	p5-Mojolicious>=5.08:www/p5-Mojolicious

USES=		perl5
USE_PERL5=	modbuild
PL_BUILD=	Build

do-install:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PERL5} ${PL_BUILD} ${INSTALL_TARGET} ${MAKE_ARGS} --destdir ${FAKE_DESTDIR})

.include <bsd.port.mk>
