PORTNAME=	cgif
PORTVERSION=	0.5.0
DISTVERSIONPREFIX=	v
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GIF encoder written in C
WWW=		https://github.com/dloebl/cgif

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		meson

MESON_ARGS=	--default-library=both \
		-Dexamples=false \
		-Dfuzzer=false \
		-Dinstall_examples=false \
		-Dtests=true

PLIST_SUB=	PORTVERSION=${PORTVERSION}

USE_GITHUB=	yes
GH_ACCOUNT=	dloebl

.include <bsd.port.mk>
