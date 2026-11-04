# Created by: Alan Eldridge <alane@geeksrus.net>

PORTNAME=	cvsbook
PORTVERSION=	1.21
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	http://cvsbook.red-bean.com/
DISTNAME=	${PORTNAME}-${PORTVERSION}-all

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tutorial and reference for CVS

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
NO_ARCH=	yes

OPTIONS_MULTI=		CVSBOOK
OPTIONS_MULTI_CVSBOOK=	INFO SINGLE_HTML SPLIT_HTML POSTSCRIPT PDF
OPTIONS_DEFAULT=	INFO SINGLE_HTML POSTSCRIPT PDF
OPTIONS_SUB=		yes

INFO_DESC=		Install the info version
SINGLE_HTML_DESC=	Install the single HTML version
SPLIT_HTML_DESC=	Install the split HTML version
POSTSCRIPT_DESC=	Install the Postscript version
PDF_DESC=		Install the PDF version

SPLIT_HTML_ALL_TARGET=		html-distributed
SPLIT_HTML_VARS_OFF=		NO_BUILD=yes
INFO_INFO=			cvsbook
INFO_VARS=			INFODIR=${PREFIX}/${INFO_PATH}

post-patch-SPLIT_HTML-on:
	@${REINPLACE_CMD} -e \
	'/Non-monolithic HTML not supported/s|@.*|makeinfo --html main.texi|' \
		${WRKSRC}/Makefile

do-install:
	@${MKDIR} ${DOCSDIR}

do-install-SPLIT_HTML-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/cvsbook-shtml
	${INSTALL_DATA} ${WRKSRC}/cvsbook/*.html ${FAKE_DESTDIR}${DOCSDIR}/cvsbook-shtml

do-install-SINGLE_HTML-on:
	${INSTALL_DATA} ${WRKSRC}/cvsbook.html ${FAKE_DESTDIR}${DOCSDIR}

do-install-PDF-on:
	${INSTALL_DATA} ${WRKSRC}/cvsbook.pdf ${FAKE_DESTDIR}${DOCSDIR}

do-install-POSTSCRIPT-on:
	${INSTALL_DATA} ${WRKSRC}/cvsbook.ps ${FAKE_DESTDIR}${DOCSDIR}

do-install-INFO-on:
	@${MKDIR} ${FAKE_DESTDIR}${INFODIR}
	${INSTALL_DATA} ${WRKSRC}/cvsbook.info* ${FAKE_DESTDIR}${INFODIR}

post-install:
	@${RMDIR} ${DOCSDIR} >/dev/null 2>&1 || ${TRUE} # remove if empty
	@if [ -d ${DOCSDIR} ]; then \
		${FIND} ${DOCSDIR} -type f | \
		${SED} 's|^${PREFIX}/||' > ${TMPPLIST}; \
	fi

.include <bsd.port.mk>
