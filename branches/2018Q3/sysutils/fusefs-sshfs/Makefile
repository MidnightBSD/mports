# $MidnightBSD$

PORTNAME=	sshfs
PORTVERSION=	2.8
DISTVERSIONPREFIX=	${PORTNAME}_
CATEGORIES=	sysutils
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount remote directories over ssh
LICENSE=	gpl2

LICENSE=	gpl2

KMODDIR?=	${LOCALBASE}/modules

WRKSRC=		${WRKDIR}/sshfs-sshfs_2.8

USE_GITHUB=	yes
GH_ACCOUNT=	libfuse

GNU_CONFIGURE=	yes
USES=		autoreconf fuse gettext pkgconfig
USE_GNOME=	glib20

PLIST_FILES=	bin/sshfs \
		man/man1/sshfs.1.gz

.include <bsd.port.mk>
