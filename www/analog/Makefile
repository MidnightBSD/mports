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
BUILD_WRKSRC=	${WRKSRC}/src

ALL_TARGET=	${PORTNAME}

SUB_FILES=	pkg-message

LIMGDIR?=	www/data/images
IMGDIR=		${PREFIX}/${LIMGDIR}
PLIST_SUB=	IMGDIR="${LIMGDIR}"

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/analog ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/analog.man ${PREFIX}/share/man/man1/analog.1
	${INSTALL_DATA} ${WRKSRC}/analog.cfg ${PREFIX}/etc/analog.cfg.sample
	${MKDIR} ${DATADIR}/lang
	${INSTALL_DATA} ${WRKSRC}/lang/* ${DATADIR}/lang
	${MKDIR} ${IMGDIR}
	${INSTALL_DATA} ${WRKSRC}/images/* ${IMGDIR}

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/* ${FAKE_DESTDIR}${DOCSDIR}

do-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.cfg ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/anlgform.html ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/anlgform.pl ${FAKE_DESTDIR}${EXAMPLESDIR}
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/css
	${INSTALL_DATA} ${WRKSRC}/examples/css/Readme.txt ${FAKE_DESTDIR}${EXAMPLESDIR}/css
	${INSTALL_DATA} ${WRKSRC}/examples/css/default.css ${FAKE_DESTDIR}${EXAMPLESDIR}/css
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/css/jreeves
	${INSTALL_DATA} ${WRKSRC}/examples/css/jreeves/* ${FAKE_DESTDIR}${EXAMPLESDIR}/css/jreeves

.include <bsd.port.mk>
