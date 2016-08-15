# $MidnightBSD$
# $FreeBSD: ports/security/linux-f10-libssh2/Makefile,v 1.4 2011/03/03 09:26:42 ehaupt Exp $

PORTNAME=	libssh2
PORTVERSION=	0.18
PORTREVISION=	1
CATEGORIES=	security linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library implementing the SSH2 protocol (Linux Fedora 10)

LICENSE=	bsd3

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	openssl
RPMVERSION=	7.fc9
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libssh2.so.1 usr/lib/libssh2.so.1.0.0
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
