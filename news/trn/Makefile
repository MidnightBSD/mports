PORTNAME=	trn
PORTVERSION=	3.6
CATEGORIES=	news
MASTER_SITES=	ftp://ftp.uu.net/networking/news/readers/trn/ \
		ftp://ftp.funet.fi/pub/unix/news/trn/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Threaded Read News newsreader

LICENSE=	other

RUN_DEPENDS=	munpack:converters/mpack

CONFLICTS_INSTALL=	s-news trn4

USES=		ncurses
WRKSRC=		${WRKDIR}/trn-3.6

HAS_CONFIGURE=	Yes
CONFIGURE_SCRIPT=	Configure
CONFIGURE_ENV=	PREFIX="${PREFIX}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	-S

SUB_FILES=	pkg-message

post-patch:
	${REINPLACE_CMD} 's/$$install/\\$${DESTDIR}&/' ${WRKSRC}/Makefile.SH

.include <bsd.port.mk>
