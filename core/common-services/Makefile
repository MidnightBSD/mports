# Created By:	Lucas Holt <luke@midnightbsd.org>

PORTNAME=	common-services
PORTVERSION=	1.8
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD Common Services

LICENSE=	agg

RUN_DEPENDS=	smbd:net/samba413 \
		cupsd:print/cups \
		dbus-daemon:devel/dbus \
		mlogind:x11/mlogind

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:

.include <bsd.port.mk>
