PORTNAME=	ve
PORTVERSION=	1.1
CATEGORIES=	chinese
MASTER_SITES=	FREEBSD_LOCAL/vanilla

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NTHU-CS Maple BBS 2.36 BBS-like editor
WWW=		http://netlab.cse.yzu.edu.tw/~statue/freebsd/zh-tut/ve.html

LICENSE=	gpl gpl2 gpl3
LICENSE_COMB=	dual

USES=		ncurses tar:tgz
MAKE_ARGS=	CC="${CC}" LIBS="${LDFLAGS} -lncurses"

PLIST_FILES=	bin/ve \
		%%DATADIR%%/ve.hlp

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}/
	${INSTALL_PROGRAM} ${WRKSRC}/ve ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/ve.hlp ${STAGEDIR}${DATADIR}/

.include <bsd.port.mk>
