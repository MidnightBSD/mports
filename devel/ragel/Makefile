PORTNAME=	ragel
PORTVERSION=	6.10
CATEGORIES=	devel
MASTER_SITES=	http://www.colm.net/files/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compile regular languages into executable C/C++ code

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

USES=	gmake
GNU_CONFIGURE=	yes

OPTIONS_DEFINE=	TEXDOCS EXAMPLES
OPTIONS_SUB=	yes
TEXDOCS_CONFIGURE_ENABLE=	manual
TEXDOCS_DESC=	Build pdf documentation (requires LaTeX)
TEXDOCS_USE=		TEX=latex:build
TEXDOCS_BUILD_DEPENDS=	fig2dev:print/transfig

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ragel/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/${PORTNAME}.1 ${STAGEDIR}${MANPREFIX}/man/man1

do-install-TEXDOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.pdf ${FAKE_DESTDIR}${DOCSDIR}

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	@(cd ${WRKSRC}/test; ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
