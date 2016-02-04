# $MidnightBSD$

PORTNAME=	joe
PORTVERSION=	4.1
CATEGORIES=	editors
MASTER_SITES=	SF/joe-editor/JOE%20sources/joe-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Joe's Own Editor

LICENSE=	gpl2

BUILD_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell
RUN_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell

OPTIONS_DEFINE=	DOCS

CONFLICTS=	joe-2.* jupp-[0-9]*

USES=		gmake iconv ncurses
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib ${ICONV_LIB}

ALL_TARGET=	${PORTNAME}

post-patch:
	${REINPLACE_CMD} -e 's|docs/README.old docs/man.md ||' ${WRKSRC}/Makefile.in

post-install:
	@${CAT} ${FILESDIR}/ftyperc.mbsd >> ${PREFIX}/etc/${PORTNAME}/ftyperc
.for file in jmacsrc jpicorc jstarrc rjoerc joerc
.if !exists(${PREFIX}/etc/${PORTNAME}/${file}.sample)
	@${CP} ${PREFIX}/etc/${PORTNAME}/${file} ${PREFIX}/etc/${PORTNAME}/${file}.sample
.endif
.endfor

.include <bsd.port.mk>
