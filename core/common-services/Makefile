PORTNAME=	common-services
PORTVERSION=	1.9
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD Common Services

LICENSE=	agg

RUN_DEPENDS=	cupsd:print/cups \
		dbus-daemon:devel/dbus \
		mlogind:x11/mlogind

USES=	samba:run

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:

.include <bsd.port.mk>
