# New ports collection makefile for:	eaccelerator
# Date created:			Sat Mar 1 13:55:55 CET 2003
# Whom:				Alex Dupre <sysadmin@alexdupre.com>
#
# $MidnightBSD$
# $FreeBSD: ports/www/eaccelerator/Makefile,v 1.39 2008/06/18 12:26:58 ale Exp $
#

PORTNAME=	eaccelerator
PORTVERSION=	0.9.5.3
CATEGORIES=	www
MASTER_SITES=	http://bart.eaccelerator.net/source/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An opcode cache for PHP with encoder and loader
LICENSE=	gpl2

USE_PHP=	session
USE_PHPIZE=	yes
USE_PHP_BUILD=	yes

CONFIGURE_ARGS=	--enable-eaccelerator=shared \
		--with-eaccelerator-shared-memory \
		--with-eaccelerator-sessions \
		--with-eaccelerator-content-caching \
		--with-eaccelerator-userid=80

USE_BZIP2=	yes
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

PORTDOCS=	*

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=	--without-eaccelerator-encoder
PLIST_SUB+=		ENCODER="@comment "

post-build:
	@${SED} "s|%%LOCALBASE%%|${LOCALBASE}|g; s|0777|0755|g" \
		${WRKSRC}/encoder.php > ${WRKSRC}/encoder
.endif

do-install:
	@${MKDIR} ${PREFIX}/lib/php/${PHP_EXT_DIR}
	${INSTALL_DATA} ${WRKSRC}/modules/${PORTNAME}.so \
	       ${PREFIX}/lib/php/${PHP_EXT_DIR}

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.ini ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/control.php ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/dasm.php ${EXAMPLESDIR}
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
