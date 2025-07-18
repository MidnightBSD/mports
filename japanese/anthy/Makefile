PORTNAME=	anthy
PORTVERSION=	0.4
PORTREVISION=	5
PORTEPOCH=	1
CATEGORIES=	japanese
MASTER_SITES=	DEBIAN
DISTFILES=	${DISTNAME:S/-/_/}.orig${EXTRACT_SUFX}
EXTRACT_ONLY=	${DISTNAME:S/-/_/}.orig${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another Kana-Kanji conversion system
WWW=		https://salsa.debian.org/debian/anthy

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/alt-cannadic/COPYING
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING

USES=		iconv:patch libtool pathfix pkgconfig
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
DOCSDIR=	${PREFIX}/share/doc/ja/anthy
ELISPDIR=	share/emacs/site-lisp/anthy
PLIST_SUB=	ELISPDIR=${ELISPDIR}

CONFLICTS_INSTALL=	ja-anthy-unicode

OPTIONS_DEFINE=	ODIC GSKKDIC DOCS

ODIC_DESC=	Okinawa Dictionary
GSKKDIC_DESC=	SKK Dictionary

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MODIC}
MASTER_SITES+=	http://www.ofug.net/~yamajun/files/:odic
DISTFILES+=	${ODIC_SRCS}:odic
ODIC_SRCS=	${ODIC_VERS}.t
ODIC_VERS=	okinawa-20070717
.endif

.if ${PORT_OPTIONS:MGSKKDIC}
MASTER_SITES+=	http://www.ohnolab.org/~kimoto/:gskk
DISTFILES+=	${GSKK_SRCS}:gskk
GSKK_SRCS=	${GSKK_VERS}.t.gz
GSKK_VERS=	gskk-20041208
.endif

post-extract:
.if ${PORT_OPTIONS:MODIC}
	${CP} ${DISTDIR}/${DIST_SUBDIR}/${ODIC_SRCS} ${WRKSRC}/mkworddic
	${PRINTF} "/mkworddic\\\\/base.t/a\\\\\\nread @top_srcdir@/mkworddic/${ODIC_SRCS}\\n" | \
	${REINPLACE_CMD} -f /dev/stdin ${WRKSRC}/mkworddic/dict.args.in
.endif

.if ${PORT_OPTIONS:MGSKKDIC}
	${CP} ${DISTDIR}/${DIST_SUBDIR}/${GSKK_SRCS} ${WRKSRC}/mkworddic
	${GUNZIP_CMD} ${WRKSRC}/mkworddic/${GSKK_SRCS}
	${PRINTF} "/mkworddic\\\\/base.t/a\\\\\\nread @top_srcdir@/mkworddic/${GSKK_VERS}.t\\n" | \
	${REINPLACE_CMD} -f /dev/stdin ${WRKSRC}/mkworddic/dict.args.in
.endif

post-patch:
	${REINPLACE_CMD} -e \
		's| install-lispLISP||g' ${WRKSRC}/src-util/Makefile.in
	${CP} ${WRKSRC}/src-util/rkhelper.c ${WRKSRC}/src-util/rkhelper.c.orig
	${ICONV_CMD} -f utf-8 -t euc-jp ${WRKSRC}/src-util/rkhelper.c.orig >  ${WRKSRC}/src-util/rkhelper.c

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/${ELISPDIR}
	${INSTALL_DATA} ${WRKSRC}/src-util/*.el ${STAGEDIR}${PREFIX}/${ELISPDIR}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/ELISP ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
