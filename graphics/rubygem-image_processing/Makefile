PORTNAME=	image_processing
PORTVERSION=	1.14.0
CATEGORIES=	graphics rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-level wrapper for processing images for the web with ImageMagick or libvips
WWW=		https://github.com/janko/image_processing

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-mini_magick4${PKGNAMESUFFIX}>=4.9.5<6:graphics/rubygem-mini_magick4@${FLAVOR} \
		rubygem-ruby-vips${PKGNAMESUFFIX}>=2.0.17<3:graphics/rubygem-ruby-vips@${FLAVOR}

USES=		gem

NO_ARCH=	yes

FLAVORS=	x11 nox11
FLAVOR?=	${FLAVORS:[1]}
nox11_PKGNAMESUFFIX=	-nox11

.include <bsd.port.mk>
