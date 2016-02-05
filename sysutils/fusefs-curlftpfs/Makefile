# $MidnightBSD$

PORTNAME=	curlftpfs
PORTVERSION=	0.9.2
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	SF
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount remote ftp directories

LICENSE=	gpl2

LIB_DEPENDS=	libfuse.so:${PORTSDIR}/sysutils/fusefs-libs \
		libcurl.so:${PORTSDIR}/ftp/curl
RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod

USES=		fuse pkgconfig
GNU_CONFIGURE=	yes
USE_GNOME=	glib20
PLIST_FILES=	bin/curlftpfs man/man1/${PORTNAME}.1.gz

.include <bsd.port.mk>
