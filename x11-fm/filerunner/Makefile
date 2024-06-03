# created by:	Chris Hutchinson <midnightbsd@BSDforge.com>
#

PORTNAME=	filerunner
PORTVERSION=	23.03.07.16
CATEGORIES=	x11-fm tk
MASTER_SITES=	SF/${PORTNAME}/release-${PORTVERSION}
DISTNAME=	fr-${PORTVERSION}

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	Tcl/Tk-based filemanager with FTP capabilities
WWW=		https://sourceforge.net/projects/filerunner/

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
