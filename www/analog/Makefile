PORTNAME=	analog
PORTVERSION=	6.0
PORTREVISION=	14
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	http://analog.gsp.com/ \
		http://fossies.org/unix/www/old/

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Fast program for analysing WWW logfiles
WWW=		https://analog.gsp.com/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/Licence.txt

LIB_DEPENDS=	libgd.so:graphics/gd \
		libpng.so:graphics/png

USES=		jpeg

LIMGDIR?=	www/data/images
IMGDIR=		${PREFIX}/${LIMGDIR}
PLIST_SUB=	IMGDIR=${LIMGDIR}

ALL_TARGET=	analog
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKSRC}/pkg-message

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} ${PREFIX}/share/analog/lang
	${MKDIR} ${IMGDIR}
	${INSTALL_DATA} ${WRKSRC}/images/* ${IMGDIR}
	${INSTALL_DATA} ${WRKSRC}/lang/* ${PREFIX}/share/analog/lang
	${INSTALL_PROGRAM} ${WRKSRC}/analog ${PREFIX}/bin
.if !exists(${PREFIX}/etc/analog.cfg)
	${INSTALL_DATA} ${WRKSRC}/analog.cfg ${PREFIX}/etc
.endif
	${INSTALL_DATA} ${WRKSRC}/analog.cfg ${PREFIX}/etc/analog.cfg-dist
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/* ${DOCSDIR}
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.cfg ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/anlgform.html ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/anlgform.pl ${EXAMPLESDIR}
	${MKDIR} ${EXAMPLESDIR}/css
	${INSTALL_DATA} ${WRKSRC}/examples/css/Readme.txt ${EXAMPLESDIR}/css
	${INSTALL_DATA} ${WRKSRC}/examples/css/default.css ${EXAMPLESDIR}/css
	${MKDIR} ${EXAMPLESDIR}/css/jreeves
	${INSTALL_DATA} ${WRKSRC}/examples/css/jreeves/* ${EXAMPLESDIR}/css/jreeves
.endif
	${INSTALL_MAN} ${WRKSRC}/analog.man ${PREFIX}/man/man1/analog.1

.include <bsd.port.post.mk>
