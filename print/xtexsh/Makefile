PORTNAME=	xtexsh
DISTVERSION=	1.4-2
CATEGORIES=	print
MASTER_SITES=	http://www.mat.univie.ac.at/~gerald/ftp/xtexsh/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tcl/Tk-based simple TeX interface

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		desktop-file-utils gnome shebangfix tk
USE_TEX=	latex
SHEBANG_FILES=	xtexsh

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:R}
NO_BUILD=	yes
NO_ARCH=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|"/etc|"${PREFIX}/etc|; \
		s|exec bash|exec sh|' ${WRKSRC}/xtexsh

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/xtexsh ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/xtexsh.1.gz ${PREFIX}/man/man1
	${INSTALL_DATA} ${WRKSRC}/xtexshrc ${PREFIX}/etc
	${INSTALL_DATA} ${WRKSRC}/xtexsh.desktop ${PREFIX}/share/applications
	@${MKDIR} ${PREFIX}/share/icons/locolor/16x16/apps
	${INSTALL_DATA} ${WRKSRC}/xtexsh-mini.png \
		${PREFIX}/share/icons/locolor/16x16/apps/xtexsh.png
	@${MKDIR} ${PREFIX}/share/icons/locolor/32x32/apps
	${INSTALL_DATA} ${WRKSRC}/xtexsh.png \
		${PREFIX}/share/icons/locolor/32x32/apps/xtexsh.png
	${INSTALL_DATA} ${WRKSRC}/xtexsh.png ${PREFIX}/share/pixmaps

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/index.html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
