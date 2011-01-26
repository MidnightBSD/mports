# $MidnightBSD$

PORTNAME=	libutempter
PORTVERSION=	1.1.5
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.altlinux.org/pub/people/ldv/utempter/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface to record user sessions to utmp and wtmp files
LICENSE=	lgpl

FAKE_MAKEARGS+= DESTDIR=${FAKE_DESTDIR}${TRUE_PREFIX}

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
