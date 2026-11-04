PORTNAME=	wcd
DISTVERSION=	6.0.7
CATEGORIES=	shells
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line program to change directory fast
WWW=		https://waterlander.net/wcd/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/doc/copying.txt

USES=		gmake localbase ncurses
MAKE_ARGS=	docsubdir=${PORTNAME} \
		EXT= \
		LIB_CURSES=-l${NCURSES_IMPL} \
		mandir=${TRUE_PREFIX}/share/man \
		PREFIX=${TRUE_PREFIX} \
		OS=freebsd
CFLAGS+=	-I${NCURSESINC}

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=		gettext
NLS_MAKE_ARGS_OFF=	ENABLE_NLS=

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' \
		${WRKSRC}/src/Makefile

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
