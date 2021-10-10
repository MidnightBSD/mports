# created by:	Chris Hutchinson <midnightbsd@BSDforge.com>
#

PORTNAME=	filerunner
PORTVERSION=	17.04.01.19
CATEGORIES=	x11-fm tk
MASTER_SITES=	https://BSDforge.com/projects/source/x11-fm/filerunner/
DISTNAME=	fr-${PORTVERSION}

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	Tcl/Tk-based filemanager with FTP capabilities

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}
NO_BUILD=	yes

USES=		desktop-file-utils
USES+=		tk:run

USE_LDCONFIG=	yes

post-patch:
	${REINPLACE_CMD} -e 's|/usr/bin/env wish|${WISH}|' ${WRKSRC}/fr

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${STAGEDIR}${DATADIR}
.for file in fr frftp
	@${CHMOD} ${BINMODE} ${STAGEDIR}${DATADIR}/${file}
.endfor 
	@${LN} -sf ${DATADIR}/fr ${STAGEDIR}${PREFIX}/bin/fr
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/applications/
	${CP} ${WRKSRC}/Makefiles/filerunner.desktop ${STAGEDIR}${PREFIX}/share/applications/
	${CP} ${WRKSRC}/icons/filerunner-48x48.png ${STAGEDIR}${PREFIX}/share/pixmaps/filerunner.png

.include <bsd.port.mk>
