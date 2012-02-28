# New ports collection makefile for:    Struts framework
# Date created:		Thu Jun 26 15:50:28 EEST 2003
# Whom:			Anton Yudin <toha@toha.org.ua>
#
# $MidnightBSD: mports/java/jakarta-struts/Makefile,v 1.1 2008/09/26 14:10:43 laffer1 Exp $
# $FreeBSD: ports/java/jakarta-struts/Makefile,v 1.7 2008/06/06 13:38:40 edwin Exp $
#

PORTNAME=	jakarta-struts
PORTVERSION=	1.2.4
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=struts/binaries
DIST_SUBDIR=	jakarta

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Struts framework
LICENSE=	apache2

USE_JAVA=	yes
JAVA_VERSION=	1.5+
NO_BUILD=	YES
USE_ZIP=	YES

JAVASHAREDIR=	share/java
TDIR=		${JAVASHAREDIR}/${PKGNAME}
PLIST_SUB+=	T=${TDIR}

do-install:
	cd ${WRKSRC} && ${FIND} . -type d -exec ${INSTALL} -d ${PREFIX}/${TDIR}/'{}' \; && \
	${FIND} . -type f -exec ${INSTALL_DATA} '{}' ${PREFIX}/${TDIR}/'{}' \;

.include <bsd.port.mk>
