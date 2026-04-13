PORTNAME=	tesseract-data
PORTVERSION=	4.1.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Trained language data for the Tesseract OCR engine
WWW=		https://github.com/tesseract-ocr/tessdata

LICENSE=	Apache-2.0

USE_GITHUB=	yes
GH_ACCOUNT=	tesseract-ocr
GH_PROJECT=	tessdata

NO_BUILD=	yes
NO_ARCH=	yes

DATADIR=	${PREFIX}/share/tessdata
PORTDATA=	*

BROKEN_sparc64=		Fails to install: runaway process

do-install:
	@${MKDIR} ${DATADIR}
.for l in ${PORTDATA}
	@${CP} ${WRKSRC}/*.traineddata ${DATADIR}/
.endfor
	@cd ${DATADIR} ; ${CHMOD} ${BINMODE} ${PORTDATA}

.include <bsd.port.mk>
