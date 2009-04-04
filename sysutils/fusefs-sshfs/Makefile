# $MidnightBSD: mports/sysutils/fusefs-sshfs/Makefile,v 1.4 2007/07/29 22:09:41 laffer1 Exp $

PORTNAME=	sshfs
PORTVERSION=	2.2
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	fuse
PKGNAMEPREFIX=	fusefs-
DISTNAME=	${PORTNAME}-fuse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount remote directories over ssh
LICENSE=	gpl2

LIB_DEPENDS=	fuse.2:${PORTSDIR}/sysutils/fusefs-libs
RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod
BUILD_DEPENDS=	fusefs-libs>2.4.1:${PORTSDIR}/sysutils/fusefs-libs

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	CFLAGS="${CFLAGS} ${PTHREAD_CFLAGS}"
USE_GNOME=	glib20

MAN1=	sshfs.1

.include <bsd.port.pre.mk>

post-install:
	@${SED} -e "s|%%PREFIX%%|${PREFIX}|" ${PKGMESSAGE}

.include <bsd.port.post.mk>
