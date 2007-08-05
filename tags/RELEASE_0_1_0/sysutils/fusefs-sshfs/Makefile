# New ports collection makefile for:	fusefs-sshfs
# Date created: 			01 October 2005
# Whom:					Anish Mistry
#
# $MidnightBSD: mports/sysutils/fusefs-sshfs/Makefile,v 1.3 2007/07/29 21:58:58 laffer1 Exp $
# $FreeBSD: ports/sysutils/fusefs-sshfs/Makefile,v 1.7 2006/03/20 16:05:41 leeym Exp $
#

PORTNAME=	sshfs
PORTVERSION=	1.8
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	fuse
PKGNAMEPREFIX=	fusefs-
DISTNAME=	${PORTNAME}-fuse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount remote directories over ssh

LIB_DEPENDS=	fuse.2:${PORTSDIR}/sysutils/fusefs-libs
RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod
BUILD_DEPENDS=	fusefs-libs>2.4.1:${PORTSDIR}/sysutils/fusefs-libs

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	CFLAGS="${CFLAGS} ${PTHREAD_CFLAGS}"
USE_GNOME=	glib20

.include <bsd.port.pre.mk>

post-install:
	@${SED} -e "s|%%PREFIX%%|${PREFIX}|" ${PKGMESSAGE}

.include <bsd.port.post.mk>
