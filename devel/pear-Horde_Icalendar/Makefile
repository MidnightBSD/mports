PORTNAME=	Horde_Icalendar
PORTVERSION=	2.1.8
CATEGORIES=	devel www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde iCalendar API
WWW=		https://pear.horde.org

LICENSE=	lgpl2.1

USES=	horde cpe
USE_HORDE_RUN=	Horde_Date \
		Horde_Exception \
		Horde_Mail \
		Horde_Mime \
		Horde_Support \
		Horde_Translation \
		Horde_Util


pre-fake:
	${REINPLACE_CMD} '/test\/Horde\/Icalendar\/fixtures\/vTimezone/d' ${WRKDIR}/package.xml


.include <bsd.port.mk>
