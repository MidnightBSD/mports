PORTNAME=	Cairo-GObject
PORTVERSION=	1.005
CATEGORIES=	devel graphics perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:XAOC
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integrate Cairo into the Glib type system

LICENSE=	lgpl2.1

BUILD_DEPENDS=	p5-ExtUtils-Depends>=0.200:devel/p5-ExtUtils-Depends \
		p5-ExtUtils-PkgConfig>=1:devel/p5-ExtUtils-PkgConfig \
		${RUN_DEPENDS}
RUN_DEPENDS=	cairo>=1.10.0:graphics/cairo \
		p5-Cairo>=1.080:graphics/p5-Cairo \
		p5-Glib>=1.224:devel/p5-Glib

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Cairo/GObject/GObject.so

.include <bsd.port.mk>
