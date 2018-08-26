# $MidnightBSD$

PORTNAME=	sessreg
PORTVERSION=	1.1.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage utmp/wtmp entries for non-init X clients

LICENSE=	mit

XORG_CAT=	app
USE_XORG=	x11
CPP+=		-P	# Required for gcc5+

PLIST_FILES=	bin/sessreg man/man1/sessreg.1.gz

.include <bsd.port.mk>
