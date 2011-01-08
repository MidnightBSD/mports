# $MidnightBSD: mports/sysutils/fusefs-curlftpfs/Makefile,v 1.2 2009/04/03 06:18:53 laffer1 Exp $

PORTNAME=	curlftpfs
PORTVERSION=	0.9.2
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	SF
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount remote ftp directories
LICENSE=	gpl2

LIB_DEPENDS=	fuse.2:${PORTSDIR}/sysutils/fusefs-libs \
		curl.6:${PORTSDIR}/ftp/curl
RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod

GNU_CONFIGURE=	yes
USE_GNOME=	glib20
MAN1=		${PORTNAME}.1
PLIST_FILES=	bin/curlftpfs

.include <bsd.port.mk>
