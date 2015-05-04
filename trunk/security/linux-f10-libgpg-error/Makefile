# $MidnightBSD$

PORTNAME=	libgpg-error
PORTVERSION=	1.6
CATEGORIES=	security linux
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common error values for all GnuPG components

LICENSE=	gpl2

USE_LINUX=	f10
USE_LINUX_RPM=	yes
RPMVERSION=	2
USE_LDCONFIG=	yes
BRANDELF_FILES=	usr/bin/gpg-error

PLIST_SUB=	PORTVERSION="${PORTVERSION}"
DESCR=		${.CURDIR}/../libgpg-error/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
