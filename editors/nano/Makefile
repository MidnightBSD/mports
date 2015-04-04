# $MidnightBSD$

PORTNAME=	nano
PORTVERSION=	2.2.6
PORTREVISION=	4
CATEGORIES=	editors
MASTER_SITES=	http://www.nano-editor.org/dist/v2.2/ \
		${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nano's ANOther editor, an enhanced free Pico clone

LICENSE=	gpl3

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--infodir=${PREFIX}/${INFO_PATH} --mandir=${PREFIX}/man \
		--docdir=${DOCSDIR}
MAKE_ARGS+=	install_htmlmanDATA=install-htmlmanDATA
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls

INFO=		nano

post-build:
	cd ${WRKSRC}/doc/man; ${REINPLACE_CMD} \
		-e 's:SYSCONFDIR:${PREFIX}/etc:g' \
		-e 's:EXAMPLESDIR:${EXAMPLESDIR}:g' \
		nano.1 rnano.1 nanorc.5 ${WRKSRC}/doc/texinfo/${INFO:=.info}
	${REINPLACE_CMD} -e 's/\\</[[:<:]]/g' -e 's/\\>/[[:>:]]/g' \
		${WRKSRC}/doc/syntax/*.nanorc

post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/nanorc.sample ${EXAMPLESDIR}

.include <bsd.port.mk>
