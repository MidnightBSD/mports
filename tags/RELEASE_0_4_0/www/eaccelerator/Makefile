# $MidnightBSD: mports/www/eaccelerator/Makefile,v 1.7 2011/09/24 02:27:57 laffer1 Exp $

PORTNAME=	eaccelerator
PORTVERSION=	0.9.6.1
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/eAccelerator%20${PORTVERSION}/ \
		http://bart.eaccelerator.net/source/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An opcode cache for PHP with loader
LICENSE=	gpl2

OPTIONS=	DOCCOMM "Retain doc-comments in internal php structures" off

USE_PHP=	yes
USE_PHPIZE=	yes
USE_PHP_BUILD=	yes

CONFIGURE_ARGS=	--enable-eaccelerator=shared \
		--with-eaccelerator-userid=80 \
		--without-eaccelerator-use-inode

USE_BZIP2=	yes
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

PORTDOCS=	*

.include <bsd.port.pre.mk>

.if defined(WITH_DOCCOMM)
CONFIGURE_ARGS+=--with-eaccelerator-doc-comment-inclusion
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

.include <bsd.port.post.mk>
