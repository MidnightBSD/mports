# Created by: thierry@pompo.net
# $FreeBSD: head/textproc/libtextcat/Makefile 360343 2014-07-03 08:29:15Z tijl $
# $MidnightBSD$

PORTNAME=	libtextcat
PORTVERSION=	2.2
CATEGORIES=	textproc
MASTER_SITES=	http://software.wise-guys.nl/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Language guessing by N-Gram-Based Text Categorization

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

GNU_CONFIGURE=	yes
USES=		libtool
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

PORTDOCS=	README TODO

post-install:
	${INSTALL_DATA} ${WRKSRC}/src/textcat.h ${STAGEDIR}${PREFIX}/include/
	${MKDIR} ${STAGEDIR}${DATADIR}/LM
	@${ECHO_MSG} "Installing language models provided in Gertjan van Noord's TextCat package"
	(cd ${WRKSRC}/langclass/LM &&		\
	${FIND} . -name "*.lm" -exec ${INSTALL_DATA} "{}" "${STAGEDIR}${DATADIR}/LM/{}" \;)
	${INSTALL_DATA} ${WRKSRC}/langclass/conf.txt "${STAGEDIR}${DATADIR}"
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

regression-test:
	(cd ${WRKSRC}/langclass/ &&		\
	for t in `${LS} ShortTexts/*.txt` ; do	\
	${ECHO_MSG} "Analyzing $$t..." ;	\
	../src/testtextcat conf.txt < $$t ;	\
	done)

.include <bsd.port.mk>
