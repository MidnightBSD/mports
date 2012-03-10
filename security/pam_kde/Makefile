# $MidnightBSD$
# $FreeBSD: ports/security/pam_kde/Makefile,v 1.1 2011/10/16 23:33:57 avilla Exp $

PORTNAME=	pam_kde
PORTVERSION=	1.0
CATEGORIES=	security kde
MASTER_SITES=	# empty
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PAM modules for KDE Display Manager
LICENSE=	unknown

NO_BUILD=	yes

PLIST_FILES=	etc/pam.d/kde

OPTIONS=	AUTOLOGIN "Install module for automatic login" on

.include <bsd.mport.options.mk>

.ifndef(WITHOUT_AUTOLOGIN)
PLIST_FILES+=	etc/pam.d/kde-np
.endif

do-install:
	${INSTALL_DATA} ${FILESDIR}/kde ${PREFIX}/etc/pam.d
.ifndef(WITHOUT_AUTOLOGIN)
	${INSTALL_DATA} ${FILESDIR}/kde-np ${PREFIX}/etc/pam.d
.endif

.include <bsd.port.mk>
