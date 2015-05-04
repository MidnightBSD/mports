# $MidnightBSD$

PORTNAME=	gnutls
PORTVERSION=	2.4.2
PORTREVISION=	2
CATEGORIES=	security linux
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Transport Layer Security library

LICENSE=	gpl2

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	libtasn1 libgcrypt libgpg-error
RPMVERSION=	5.fc10
USE_LDCONFIG=	yes

PLIST_SUB=	PORTVERSION="${PORTVERSION}"
DESCR=		${PORTSDIR}/security/gnutls/pkg-descr

.include <bsd.port.mk>
