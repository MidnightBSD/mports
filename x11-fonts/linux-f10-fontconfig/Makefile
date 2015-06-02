# $MidnightBSD$

PORTNAME=	fontconfig
PORTVERSION=	2.6.0
PORTREVISION=	1
CATEGORIES=	x11-fonts linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML-based font configuration API for X Windows (Linux Fedora 10)

LICENSE=	mit

CONFLICTS=	linux-fontconfig-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	expat

RPMVERSION=	3.fc10
BRANDELF_DIRS=	usr/bin
USE_LDCONFIG=	yes

# We will use some other configuration file, so delete a linux one
# Don't let the linux fc-cache mess up the native cache file
post-extract:
		@${RM} -r ${WRKSRC}/etc ${WRKSRC}/usr/share/fonts ${WRKSRC}/var \
			${WRKSRC}/usr/bin/fc-cache \
			${WRKSRC}/usr/share/man/man1/fc-cache.1.gz

post-install:
		${MKDIR} ${PREFIX}/etc
		@${LN} -s ${LOCALBASE}/etc/fonts ${PREFIX}/etc/

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
