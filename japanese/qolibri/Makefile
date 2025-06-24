PORTNAME=	qolibri
DISTVERSION=	2.1.4
PORTREVISION=	1
CATEGORIES=	japanese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	EPWING dictionary viewer
WWW=		https://github.com/ludios/qolibri/

LICENSE=	gpl2

LIB_DEPENDS=	libeb.so:japanese/eb

USES=		cmake qt:5
USE_QT=		buildtools core declarative gui linguisttools location \
		multimedia network printsupport qmake webchannel webengine \
		widgets

USE_GITHUB=	yes
GH_ACCOUNT=	ludios

PLIST_FILES=	bin/qolibri

.include <bsd.port.mk>
