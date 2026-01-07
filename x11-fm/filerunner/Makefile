# created by:	Chris Hutchinson <midnightbsd@BSDforge.com>

PORTNAME=	filerunner
DISTVERSION=	24.07.12.20
CATEGORIES=	x11-fm tk
MASTER_SITES=	SF/${PORTNAME}/release-${DISTVERSION}
DISTNAME=	fr-${DISTVERSION}

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	Tcl/Tk-based filemanager with FTP capabilities
WWW=		https://sourceforge.net/projects/filerunner/

LICENSE=	gpl2

USES=		shebangfix tk:run
USE_LDCONFIG=	yes

SHEBANG_FILES=	fr frftp
tk_OLD_CMD=	"/usr/bin/env wish"

NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

do-install:
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR} \
		'! ( -name fr -o -name frftp ) ')
	${INSTALL_SCRIPT} ${WRKSRC}/fr ${WRKSRC}/frftp ${STAGEDIR}${DATADIR}
	${RLN} ${STAGEDIR}${DATADIR}/fr ${STAGEDIR}${PREFIX}/bin
	${FIND} ${FAKE_DESTDIR}${TRUE_PREFIX} -type f -iname '*.orig' -delete

.include <bsd.port.mk>
