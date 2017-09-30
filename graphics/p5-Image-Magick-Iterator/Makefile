# $MidnightBSD$

PORTNAME=	Image-Magick-Iterator
PORTVERSION=	0.01
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Image
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sequentially read Image::Magick object from a filehandle
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Image/Magick.pm:${PORTSDIR}/graphics/ImageMagick \
		${SITE_PERL}/Image/PBMlib.pm:${PORTSDIR}/graphics/p5-Image-PBMlib

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
