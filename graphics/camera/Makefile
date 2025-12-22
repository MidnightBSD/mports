PORTNAME=	camera
PORTVERSION=	0.8
PORTREVISION=	3
CATEGORIES=	graphics gnustep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep application for digital still cameras
WWW=		https://github.com/gsimageapps/Camera

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/Documentation/COPYING

LIB_DEPENDS=	libgphoto2_port.so:graphics/libgphoto2

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build

USE_GITHUB=	yes
GH_ACCOUNT=	gsimageapps
GH_PROJECT=	Camera
GH_TAGNAME=	37ac903daf716e2dedc2dc7a44f15ad90137eb49

post-patch:
	${REINPLACE_CMD} 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Camera.app/Camera

.include <bsd.port.mk>
