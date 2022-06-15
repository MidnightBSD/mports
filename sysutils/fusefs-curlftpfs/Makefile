PORTNAME=	curlftpfs
PORTVERSION=	0.9.2
PORTREVISION=	3
CATEGORIES=	sysutils
MASTER_SITES=	SF
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount remote ftp directories

LICENSE=	gpl2

LIB_DEPENDS=	libfuse.so:sysutils/fusefs-libs \
		libcurl.so:ftp/curl

USES=		fuse gnome pkgconfig
GNU_CONFIGURE=	yes
USE_GNOME=	glib20
PLIST_FILES=	bin/curlftpfs man/man1/${PORTNAME}.1.gz

.include <bsd.port.mk>
