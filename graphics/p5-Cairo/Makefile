# Created by: Michael Johnson <ahze@FreeBSD.org>

PORTNAME=	Cairo
PORTVERSION=	1.107
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN \
		SF/gtk2-perl/${PORTNAME}/${PORTVERSION}
MASTER_SITE_SUBDIR=	CPAN:XAOC
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl bindings to the cairo graphics library

LICENSE=	lgpl2.1

BUILD_DEPENDS=	p5-ExtUtils-Depends>=0.200:devel/p5-ExtUtils-Depends \
		p5-ExtUtils-PkgConfig>=1:devel/p5-ExtUtils-PkgConfig
LIB_DEPENDS=	libcairo.so:graphics/cairo

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
