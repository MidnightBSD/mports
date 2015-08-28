# $MidnightBSD$
# $FreeBSD: head/graphics/camerakit/Makefile 389998 2015-06-17 22:44:29Z amdmi3 $

PORTNAME=	camerakit
PORTVERSION=	0.0.1
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/gsimageapps/
DISTNAME=	CameraKit-20041011

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework that allows to access digital cameras

LICENSE=	unknown

LIB_DEPENDS=	libgphoto2.so:${PORTSDIR}/graphics/libgphoto2

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	build back
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/CameraKit

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Library/Frameworks/CameraKit.framework/Versions/0/libCameraKit.so

.include <bsd.port.mk>
