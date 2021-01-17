# Created By:	Lucas Holt <luke@midnightbsd.org>

PORTNAME=	common-services
PORTVERSION=	1.7
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD Common Services

LICENSE=	agg

RUN_DEPENDS=	smbd:net/samba413 \
		cupsd:print/cups \
		dbus-daemon:devel/dbus \
		${LOCALBASE}/sbin/hald:sysutils/hal \
		mlogind:x11/mlogind

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:

.include <bsd.port.mk>
