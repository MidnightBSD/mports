PORTNAME=	camerakit
PORTVERSION=	0.0.1
PORTREVISION=	2
CATEGORIES=	graphics gnustep
MASTER_SITES=	ftp://ftp.midnightbsd.org/pub/MidnightBSD/mports/distfiles/
DISTNAME=	CameraKit-20041011

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework that allows to access digital cameras
WWW=            https://github.com/gsimageapps/Camera

LICENSE=	gpl2+

LIB_DEPENDS=	libgphoto2.so:graphics/libgphoto2

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	build back
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

WRKSRC=		${WRKDIR}/CameraKit

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Library/Frameworks/CameraKit.framework/Versions/0/libCameraKit.so

.include <bsd.port.mk>
