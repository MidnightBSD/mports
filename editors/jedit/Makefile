PORTNAME=	jedit
PORTVERSION=	5.7.0
PORTEPOCH=	1
CATEGORIES=	editors java
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}${PORTVERSION}install
EXTRACT_SUFX=	.jar

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Powerful programmer\'s text editor written in Java
WWW=		https://jedit.sourceforge.net/

LICENSE=	gpl2

USES=		cpe java xorg

OPTIONS_DEFINE=	MACROS DOCS
MACROS_DESC=	Install default set of macros (highly recommended)

OPTIONS_DEFAULT=	MACROS
OPTIONS_SUB=	yes

JAVA_VERSION=	11+

USE_XORG=	x11
NO_BUILD=	yes

DATADIR=	${JAVASHAREDIR}/${PORTNAME}
DOCSDIR=	${DATADIR}/doc
PORTDOCS=	*
SUB_FILES=	jedit.sh

DESKTOP_ENTRIES="jEdit" "${COMMENT}" "${PORTNAME}" \
	"${PORTNAME}" "Development;" false

post-extract:
	@(cd ${WRKDIR}/installer ; ${TAR} -xjf jedit-api.tar.bz2 ;\
		${TAR} -xjf jedit-macros.tar.bz2 ; \
		${TAR} -xjf jedit-program.tar.bz2)

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKDIR}/installer/${PORTNAME}.jar ${DATADIR}/
.for dir in doc jars keymaps modes properties startup
	(cd ${WRKDIR}/installer ; ${COPYTREE_SHARE} ${dir} ${DATADIR}/)
.endfor
	(cd ${WRKDIR}/installer ; ${TAR} --exclude 'modes' --exclude 'keymaps' \
		-chf - macros | ${TAR}  -xf - -C ${DATADIR}/)
	${INSTALL_SCRIPT} ${WRKDIR}/jedit.sh ${PREFIX}/bin/jedit
	${INSTALL_DATA} ${DATADIR}/doc/jedit.png \
		${PREFIX}/share/pixmaps/${PORTNAME}.png
	${INSTALL_MAN} ${WRKDIR}/jedit.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
