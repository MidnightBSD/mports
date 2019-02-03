# $MidnightBSD$

PORTNAME=	finch
PORTREVISION=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Finch multi-protocol messaging client (Console UI)

LIB_DEPENDS=	libpurple.so:net-im/libpurple

MASTERDIR=	${.CURDIR}/../libpurple
BUILD_WRKSRC=	${WRKSRC}/finch
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

PIDGIN_SLAVE=	yes
WITH_CONSOLEUI=	yes

CPPFLAGS+=	-DNCURSES_WIDECHAR -D_XOPEN_SOURCE_EXTENDED
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtkui \
		--disable-nm \
		--with-dynamic_prpls=${PRPL_MODULES:S/,$//}

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/finch.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

.include "${MASTERDIR}/Makefile"
