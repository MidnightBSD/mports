PORTNAME=	qt5
PORTVERSION=	5.15.9
CATEGORIES=	devel linux
PKGNAMEPREFIX=	linux-${linux_ARGS}-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform application and UI framework, metaport (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.qt.io/

LICENSE=	bsd2

USES=		linux:rl9 metaport
USE_LINUX=	qt3d qtbase qtconnectivity qtdeclarative qtgraphicaleffects \
		qtimageformats qtmultimedia qtquickcontrols qtscript qtsensors \
		qtserialbus qtserialport qtsvg qttools qtwayland \
		qtwebchannel qtwebsockets qtx11extras qtxmlpatterns

DESCR=		${PORTSDIR}/devel/${PORTNAME}/pkg-descr

.include <bsd.mport.options.mk>

.include <bsd.port.mk>
