PORTNAME=	gettext-lint
PORTVERSION=	0.4
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check the validity and consistency of PO and POT files
WWW=		https://gettext-lint.sourceforge.net/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

NO_BUILD=	yes

USES=		gettext-tools:run python:run shebangfix
SHEBANG_FILES=	src/POFileEquiv.in src/POFileGlossary.in

post-patch:
.for i in POFileChecker POFileClean POFileConsistency POFileEquiv POFileFill \
	POFileGlossary POFileSpell POFileStatus
	cd ${WRKSRC}/src && ${SED} -e 's|@PYTHON@|${PYTHON_CMD}|g ; \
		 s|@prefix@/share/@PACKAGE@|${PYTHON_SITELIBDIR}/${PORTNAME}|g' ${i}.in > ${i}
.endfor

do-install:
.for i in POFileChecker POFileClean POFileConsistency POFileEquiv POFileFill \
	POFileGlossary POFileSpell POFileStatus
	${INSTALL_SCRIPT} ${WRKSRC}/src/${i} ${STAGEDIR}${PREFIX}/bin/${i}
	${INSTALL_MAN} ${WRKSRC}/doc/${i}.1 ${STAGEDIR}${PREFIX}/share/man/man1/${i}.1
.endfor
	@${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/src/*.py \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}
	@${MKDIR} ${FAKE_DIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/etc/*.css ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/etc/*.xsl ${DATADIR}

.include <bsd.port.mk>
