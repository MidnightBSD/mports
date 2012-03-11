# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-dri74/Makefile,v 1.2 2009/09/14 09:44:55 bsam Exp $

PORTNAME=	dri
PORTVERSION=	7.4
CATEGORIES=	graphics linux
MASTER_SITES=	ftp://ftp.ipt.ru/pub/download/ \
		http://people.freebsd.org/~bsam/download/
PKGNAMEPREFIX=	linux-
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD$
COMMENT=	Mesa-based DRI libraries, drivers and binaries (Linux Ubuntu 9.0.4)
LICENSE=	mit

CONFLICTS=	linux_dri-6.5.2006* linux-libGLU-[0-9]* linux_dri-[0-9]* linux-f8-dri-[0-9]* linux-f10-dri-[0-9]* \
		linux-f10-libGLU-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
NO_BUILD=	yes
USE_BZIP2=	yes
USE_LINUX_PREFIX=yes
USE_LDCONFIG=	yes

do-install:
	@cd ${WRKSRC} && ${SH} -c '(${FIND} -d . | ${CPIO} -dumpl ${PREFIX}) > /dev/null 2>&1'

.include <bsd.port.mk>
