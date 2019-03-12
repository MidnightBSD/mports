# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	Module-Build-Tiny
PORTVERSION=	0.039
PORTREVISION=	2
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny replacement for Module::Build

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-ExtUtils-Config>=0.003:devel/p5-ExtUtils-Config \
		p5-ExtUtils-Helpers>=0.020:devel/p5-ExtUtils-Helpers \
		p5-ExtUtils-InstallPaths>=0.002:devel/p5-ExtUtils-InstallPaths

NO_ARCH=	yes
USE_PERL5=	modbuildtiny
USES=		perl5

.include <bsd.port.mk>
