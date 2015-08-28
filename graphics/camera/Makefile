# Created by: gurkan@phys.ethz.ch
# $FreeBSD: head/graphics/camera/Makefile 383626 2015-04-09 07:44:41Z bapt $

PORTNAME=	camera
PORTVERSION=	0.8
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/gsimageapps/
DISTNAME=	Camera-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep application for digital still cameras

LICENSE=	gpl2 # or later
LICENSE_FILE=	${WRKSRC}/Documentation/COPYING

LIB_DEPENDS=	libgphoto2_port.so:${PORTSDIR}/graphics/libgphoto2

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Camera

post-patch:
	${REINPLACE_CMD} 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/Camera.app/Camera

.include <bsd.port.mk>
