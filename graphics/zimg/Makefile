PORTNAME=	zimg
PORTVERSION=	5.0.0
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image-generator that uses ASCII input files to create PNGs/EDFs
WWW=		https://zimg.sourceforge.net/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgd.so:graphics/gd \
		libpng.so:graphics/png

USES=		jpeg

CONFLICTS_INSTALL=	sekrit-twc-zimg-* # include/zimg.h

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
CONFIGURE_ARGS=	--with-dynaload-cc="${CC}" \
		--with-dynaload-cflags="${CFLAGS} -shared" \
		--with-gd-includes="${LOCALBASE}/include" \
		--with-gd-lib="${LOCALBASE}/lib"

PLIST_FILES=	include/zimg.h bin/zimg \
		share/man/man1/zimg.1.gz

CFLAGS+=	-DHAVE_GD_FREETYPE

.include <bsd.port.mk>
