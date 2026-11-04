PORTNAME=	mlmmj-webview
PORTVERSION=	0.1.0
CATEGORIES=	mail www
MASTER_SITES=	https://codeberg.org/bapt/${PORTNAME}/archive/${DISTVERSIONFULL}${EXTRACT_SUFX}?dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny web frontend for mlmmj
WWW=		https://codeberg.org/bapt/mlmmj-webview

LICENSE=	bsd2

LIB_DEPENDS=	libkcgi.so:www/kcgi \
		libucl.so:textproc/libucl

USES=		pkgconfig
WRKSRC=		${WRKDIR}/${PORTNAME}

HAS_CONFIGURE=	yes

.include <bsd.port.mk>
