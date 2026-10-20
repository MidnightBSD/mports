PORTNAME=	libs-back
DISTVERSION=	20260129
CATEGORIES=	x11-toolkits gnustep
PKGNAMEPREFIX=	gershwin-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep GUI backend
WWW=		http://www.gnustep.org/

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi

LIB_DEPENDS+=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libcairo.so:graphics/cairo

USES=		gl gershwin pkgconfig xorg
CONFLICTS=	gnustep-back
USE_GERSHWIN=	base gui build
USE_XORG=	x11 xcursor xext xfixes xft xmu xrandr xrender xt
USE_GL=	gl

USE_GITHUB=	yes
GH_ACCOUNT=	gnustep
GH_TAGNAME=	bf3b3ced525f08415a20d109f05be1f91492414c

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-graphics=cairo \
		--disable-glitz

MAKE_FLAGS+=	OPTFLAG="${CFLAGS} -I${LOCALBASE}/include"

CFLAGS+=	-I${LOCALBASE}/include/freetype2

pre-configure:
.for file in config.guess config.sub install-sh
		 @${CP} ${GNUSTEP_PREFIX}/System/Library/Makefiles/${file} ${WRKSRC}
.endfor

.include <bsd.port.mk>
