# New ports collection makefile for:	fusefs-curlftpfs
# Date created:		25 May 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/fusefs-curlftpfs/Makefile,v 1.6 2006/12/15 22:08:00 sat Exp $
#

PORTNAME=	curlftpfs
PORTVERSION=	0.9
CATEGORIES=	sysutils
MASTER_SITES=	SF
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount remote ftp directories

LIB_DEPENDS=	fuse.2:${PORTSDIR}/sysutils/fusefs-libs \
		curl.4:${PORTSDIR}/ftp/curl
RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod

GNU_CONFIGURE=	yes
USE_GNOME=	glib20
MAN1=		${PORTNAME}.1
PLIST_FILES=	bin/curlftpfs

.include <bsd.port.mk>
