PORTNAME=	Horde_SyncMl
PORTVERSION=	2.0.7
CATEGORIES=	comms www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde API for processing SyncML requests
WWW=		https://pear.horde.org

USES=		horde cpe
USE_HORDE_RUN=	Horde_Date \
		Horde_Icalendar \
		Horde_Log \
		Horde_Support \
		Horde_Util \
		Horde_Xml_Wbxml \
		Horde_Translation \

# optional but we want it
USE_HORDE_RUN+= Horde_Auth \
		Horde_Core

.include <bsd.port.mk>
