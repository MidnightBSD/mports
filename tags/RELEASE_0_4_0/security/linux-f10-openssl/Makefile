# $MidnightBSD: mports/security/linux-f10-openssl/Makefile,v 1.1 2011/06/19 19:26:22 laffer1 Exp $
# $FreeBSD: ports/security/linux-f10-openssl/Makefile,v 1.9 2011/03/03 09:26:42 ehaupt Exp $

PORTNAME=	openssl
PORTVERSION=	0.9.8g
CATEGORIES=	security linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The OpenSSL toolkit (Linux Fedora 10)
LICENSE=	other

CONFLICTS=	linux-openssl-[0-9]* 

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	14.fc10
BRANDELF_FILES=	usr/bin/openssl
USE_LDCONFIG=	yes

PLIST_SUB+=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
