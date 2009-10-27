# $MidnightBSD: mports/www/eaccelerator/Makefile,v 1.2 2008/10/16 21:17:39 laffer1 Exp $

PORTNAME=	eaccelerator
PORTVERSION=	0.9.6
CATEGORIES=	www
MASTER_SITES=	http://bart.eaccelerator.net/source/${PORTVERSION}/
DISTNAME=	eaccelerator-0.9.6-rc1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An opcode cache for PHP with loader
LICENSE=	gpl2

USE_PHP=	session
USE_PHPIZE=	yes
USE_PHP_BUILD=	yes

CONFIGURE_ARGS=	--enable-eaccelerator=shared \
		--with-eaccelerator-shared-memory \
		--with-eaccelerator-sessions \
		--with-eaccelerator-content-caching \
		--with-eaccelerator-userid=80 \
		--without-eaccelerator-encoder

USE_BZIP2=	yes
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

PORTDOCS=	*

.include <bsd.port.pre.mk>

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

.include <bsd.port.post.mk>
