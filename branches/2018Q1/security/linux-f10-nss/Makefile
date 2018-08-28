# $MidnightBSD$
# $FreeBSD: ports/security/linux-f10-nss/Makefile,v 1.6 2011/03/03 09:26:42 ehaupt Exp $

PORTNAME=	nss
PORTVERSION=	3.12.3.99.3
PORTREVISION=	1
CATEGORIES=	security linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network Security Services (Linux Fedora 10)

LICENSE=	mpl

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	nspr sqlite3
RPMVERSION=	2.10.6.fc10
USE_LDCONFIG=	yes

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
