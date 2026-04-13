PORTNAME=	ocrad
PORTVERSION=	0.22
CATEGORIES=	graphics
MASTER_SITES=	GNU
MASTER_SITE_SUBDIR=	${PORTNAME}
EXTRACT_SUFX=	.tar.lz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OCR program implemented as filter
WWW=		https://www.gnu.org/software/ocrad/ocrad.html

LICENSE=	gpl2

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX} CXXFLAGS="${CXXFLAGS}" CXX="${CXX}"
CXXFLAGS+=	-Wall -W
MAKE_ARGS=	-j`${SYSCTL} -n hw.ncpu`

PLIST_FILES=	bin/${PORTNAME} share/man/man1/ocrad.1.gz

PORTDOCS=	AUTHORS ChangeLog NEWS README
PORTEXAMPLES=	*

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.mport.options.mk>

EXTRACT_DEPENDS=lzip:${PORTSDIR}/archivers/lzip
EXTRACT_CMD=	${LOCALBASE}/bin/lzip
EXTRACT_BEFORE_ARGS=	-cd
EXTRACT_AFTER_ARGS=	| ${TAR} -xf -

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/ocrad.1 ${PREFIX}/share/man/man1

.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.if ${PORT_OPTIONS:MEXAMPLES}
	@${MKDIR} ${EXAMPLESDIR}
	@(cd ${WRKSRC}/testsuite && ${COPYTREE_SHARE} \* ${EXAMPLESDIR})
.endif

.include <bsd.port.mk>
