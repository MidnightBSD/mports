PORTNAME=	gopherus
DISTVERSION=	1.2.2
CATEGORIES=	www
MASTER_SITES=	SF/gopherus/v${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Classic text interface to the gopherspace
WWW=		https://gopherus.sourceforge.net/

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		ncurses tar:xz uidfix
MAKEFILE=	${FILESDIR}/Makefile
CFLAGS+=	-I${NCURSESINC} -I${LOCALBASE}/include
LDFLAGS+=	-L${NCURSESLIB} ${NCURSESLIBS} 

PLIST_FILES=	bin/gopherus

.include <bsd.port.mk>
