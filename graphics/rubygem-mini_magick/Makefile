PORTNAME=	mini_magick
PORTVERSION=	5.2.0
CATEGORIES=	graphics rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulate images with minimal use of memory via ImageMagick
WWW=		https://github.com/minimagick/minimagick

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-benchmark>=0:benchmarks/rubygem-benchmark \
		rubygem-logger>=0:devel/rubygem-logger

USES=		gem magick:${FLAVOR}

NO_ARCH=	yes

FLAVORS=	x11 nox11
FLAVOR?=	${FLAVORS:[1]}
nox11_PKGNAMESUFFIX=	-nox11

.include <bsd.port.mk>
