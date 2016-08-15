# $MidnightBSD$

PORTNAME=	sshfs
PORTVERSION=	2.5
CATEGORIES=	sysutils
MASTER_SITES=	SF/fuse/${PORTNAME}-fuse/${PORTVERSION}
PKGNAMEPREFIX=	fusefs-
DISTNAME=	${PORTNAME}-fuse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount remote directories over ssh
LICENSE=	gpl2

LICENSE=	gpl2

KMODDIR?=	${LOCALBASE}/modules

GNU_CONFIGURE=	yes
USES=		fuse pkgconfig
USE_GNOME=	glib20

PLIST_FILES=	bin/sshfs \
		man/man1/sshfs.1.gz

.include <bsd.port.mk>
