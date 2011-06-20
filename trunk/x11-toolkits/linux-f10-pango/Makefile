# $MidnightBSD: mports/x11-toolkits/linux-f10-pango/Makefile,v 1.2 2011/06/20 00:30:14 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/linux-f10-pango/Makefile,v 1.25 2011/03/07 15:08:24 ehaupt Exp $

PORTNAME=	pango
PORTVERSION=	1.28.3
DISTVERSIONSUFFIX=	-1.fc10
CATEGORIES=	x11-toolkits linux
MASTER_SITES=	LOCAL
MASTER_SITE_SUBDIR=	netchild/rpms/${LINUX_DIST}${LINUX_DIST_VER}
MASTER_SITE_SRC_SUBDIR=	netchild/rpms/${LINUX_DIST}${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The pango library (Linux Fedora 10)
LICENSE=	lgpl

CONFLICTS=	linux-pango-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
# these libraries are required by pango-querymodules
USE_LINUX_APPS=	cairo expat fontconfig xorglibs
LINUX_DIST_VER=	10
RPMVERSION=	1.fc10
BRANDELF_FILES=	usr/bin/pango-querymodules-32
USE_LDCONFIG=	yes

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

post-install:
#	@${PREFIX}/usr/bin/pango-querymodules-32 > ${PREFIX}/etc/pango/i686-pc-linux-gnu/pango.modules

.include <bsd.port.mk>
