PORTNAME=	kdrill
PORTVERSION=	6.5
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://www.bolthole.com/kdrill/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program to quiz you on the meanings of Kanji
WWW=		http://www.bolthole.com/kdrill/

LICENSE=	boltholl
LICENSE_NAME=	boltholl
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

FAKE_OPTS=	trueprefix

RUN_DEPENDS=	xjdic:japanese/edict

USES=		imake xorg
USE_XORG=	ice sm x11 xaw xext xmu xpm xt

DATADIR=	${PREFIX}/share/dict/kdrill
MAKE_ARGS=	MANDIR=${PREFIX}/share/man/man1

.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-build:
	@(cd ${WRKSRC}/makedic && ${DO_MAKE_BUILD} ${ALL_TARGET})

post-install:
.for i in makedic makeedict
	(cd ${WRKSRC}/makedic && ${INSTALL_PROGRAM} ${i} \
		${STAGEDIR}${PREFIX}/bin)
	(cd ${WRKSRC}/makedic && ${INSTALL_MAN} ${i}.1 \
		${STAGEDIR}${PREFIX}/share/man/man1)
.endfor
	@${MKDIR} ${STAGEDIR}${DATADIR}
.for i in fullkatahira.edic hira.edic hiraplus.edic kata.edic kataplus.edic
	(cd ${WRKSRC}/makedic && ${INSTALL_DATA} ${i} \
		${STAGEDIR}${DATADIR})
.endfor

.include <bsd.port.mk>
