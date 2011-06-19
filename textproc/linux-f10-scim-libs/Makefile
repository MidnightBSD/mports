# $MidnightBSD$
# $FreeBSD: ports/textproc/linux-f10-scim-libs/Makefile,v 1.11 2011/03/03 09:26:43 ehaupt Exp $

PORTNAME=	scim-libs
PORTVERSION=	1.4.7
CATEGORIES=	textproc linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Smart Common Input Method libraries (Linux Fedora 10)
LICENSE=	unknown

CONFLICTS=	linux-scim-libs-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	gtk2
LINUX_DIST_VER=	10
RPMVERSION=	35.fc10
USE_LDCONFIG=	yes
SRC_DISTFILES=	scim-${PORTVERSION}-${RPMVERSION}.src.rpm

DESCR=		${.CURDIR}/../scim/pkg-descr

post-install:
	@chroot ${PREFIX} /usr/bin/gtk-query-immodules-2.0-32 > ${PREFIX}/etc/gtk-2.0/${LINUX_RPM_ARCH}-redhat-linux-gnu/gtk.immodules

.include <bsd.port.mk>
