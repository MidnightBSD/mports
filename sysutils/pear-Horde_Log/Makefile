PORTNAME=	Horde_Log
PORTVERSION=	2.3.0
PORTREVISION=	1
CATEGORIES=	sysutils www pear
PKGNAMEPREFIX=	${PEAR_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde Logging library
WWW=		https://pear.horde.org

OPTIONS_DEFINE=	SCRIBE
SCRIBE_DESC=	Enable scribe support

USES=	horde cpe
USE_HORDE_RUN=	Horde_Constraint \
		Horde_Exception

SCRIBE_USE=	HORDE_RUN=Horde_Scribe

.include <bsd.port.mk>
