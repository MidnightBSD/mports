# New ports collection makefile for:	pear
# Date created:			25 Nov 2005
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $FreeBSD: ports/devel/pear/Makefile,v 1.19 2006/08/21 08:42:30 ale Exp $
# $MidnightBSD: mports/devel/pear/Makefile,v 1.1 2006/12/04 05:17:16 laffer1 Exp $
#

PORTNAME=	pear
PORTVERSION=	1.4.11
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	ale

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEAR framework for PHP

USE_BZIP2=	yes
NO_BUILD=	yes

WANT_PHP_CLI=	yes
USE_PHP=	pcre xml
USE_PHP_BUILD=	yes

SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

PEARDIR=	${PREFIX}/share/pear

BROKEN=		does not fake

post-patch:
	@${REINPLACE_CMD} "s|%%PREFIX%%|${PREFIX}|" ${WRKSRC}/go-pear

do-install:
	@${MKDIR} ${PEARDIR}
	${LOCALBASE}/bin/php -q ${WRKSRC}/go-pear
	${PATCH} -p0 -s -b .orig -d ${PEARDIR} < ${PATCHDIR}/PEAR_Installer.php.patch
	${RM} -f ${PEARDIR}/PEAR/Installer.php.orig

.include <bsd.port.mk>
