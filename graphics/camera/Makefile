# Created by: gurkan@phys.ethz.ch

PORTNAME=	camera
PORTVERSION=	0.8
PORTREVISION=	2
CATEGORIES=	graphics gnustep
MASTER_SITES=	ftp://ftp.midnightbsd.org/pub/MidnightBSD/mports/distfiles/
DISTNAME=	Camera-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep application for digital still cameras
WWW=		https://github.com/gsimageapps/Camera

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/Documentation/COPYING

LIB_DEPENDS=	libgphoto2_port.so:graphics/libgphoto2

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Camera

post-patch:
	${REINPLACE_CMD} 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Camera.app/Camera

.include <bsd.port.mk>
