# $MidnightBSD$

PORTNAME=	nano
PORTVERSION=	3.1
CATEGORIES=	editors
MASTER_SITES=	http://www.nano-editor.org/dist/v${PORTVERSION:R}/ GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nano's ANOther editor, an enhanced free Pico clone

LICENSE=	gpl3

CONFLICTS=	nano-devel-2*

USES=		charsetfix ncurses
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--infodir=${PREFIX}/${INFO_PATH} --mandir=${PREFIX}/man \
		--docdir=${DOCSDIR} --enable-utf8
MAKE_ARGS+=	install_htmlmanDATA=install-htmlmanDATA
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	DOCS EXAMPLES NLS
OPTIONS_SUB=	yes

DOCS_USES=	groff

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls

INFO=		nano

PORTSCOUT=	limitw:1,even

post-configure:
	${REINPLACE_CMD} -e 's/update_revision//g' ${WRKSRC}/src/Makefile

post-build:
	cd ${WRKSRC}/doc; ${REINPLACE_CMD} \
		-e 's:SYSCONFDIR:${PREFIX}/etc:g' \
		-e 's:EXAMPLESDIR:${EXAMPLESDIR}:g' \
		nano.1 rnano.1 nanorc.5 ${WRKSRC}/doc/${INFO:=.info}

post-install:
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/sample.nanorc ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
