# New ports collection makefile for:	ZendOptimizer
# Date created:			Thu Apr 24 00:23:22 CET 2003
# Whom:				Alex Dupre <sysadmin@alexdupre.com>
#
# $MidnightBSD: mports/devel/ZendOptimizer/Makefile,v 1.2 2008/08/25 17:28:02 laffer1 Exp $
# $FreeBSD: ports/devel/ZendOptimizer/Makefile,v 1.31 2008/01/26 13:44:55 ale Exp $
#

PORTNAME=	ZendOptimizer
DISTVERSION=	3.3.0a
CATEGORIES=	devel
MASTER_SITES=	http://downloads.zend.com/optimizer/${DISTVERSION}/
DISTNAME=	${PORTNAME}-${DISTVERSION}-freebsd${VER}-${ARCH}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An optimizer for PHP code
LICENSE=	other

ONLY_FOR_ARCHS=	i386 amd64
NO_BUILD=	yes
USE_PHP=	yes

SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

.include <bsd.port.pre.mk>

VER=		6.0
.if ${OSVERSION} >= 3000
LIB_DEPENDS+=	m.4:${PORTSDIR}/misc/compat6x
.endif

ZEND_PATH=	5.2.x

PLIST_SUB+=	ZEND_PATH=${ZEND_PATH}

PORTDOCS=	*

do-install:
	@${MKDIR} ${PREFIX}/lib/php/${PHP_EXT_DIR}/Optimizer/php-${ZEND_PATH}
	${INSTALL_DATA} ${WRKSRC}/data/${ZEND_PATH:S/./_/g}_comp/ZendOptimizer.so \
		${PREFIX}/lib/php/${PHP_EXT_DIR}/Optimizer/php-${ZEND_PATH}/ZendOptimizer.so
	@${MKDIR} ${PREFIX}/lib/php/${PHP_EXT_DIR}/Optimizer_TS/php-${ZEND_PATH}
	${INSTALL_DATA} ${WRKSRC}/data/${ZEND_PATH:S/./_/g}_comp/TS/ZendOptimizer.so \
		${PREFIX}/lib/php/${PHP_EXT_DIR}/Optimizer_TS/php-${ZEND_PATH}/ZendOptimizer.so
	${INSTALL_DATA} ${WRKSRC}/data/ZendExtensionManager.so \
		${PREFIX}/lib/php/${PHP_EXT_DIR}
	${INSTALL_DATA} ${WRKSRC}/data/ZendExtensionManager_TS.so \
		${PREFIX}/lib/php/${PHP_EXT_DIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/EULA-ZendOptimizer ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README-ZendOptimizer ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/data/doc/* ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
