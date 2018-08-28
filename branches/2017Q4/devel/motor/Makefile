# $MidnightBSD$

PORTNAME=	motor
PORTVERSION=	3.4.0
PORTREVISION=	5
CATEGORIES=	devel
MASTER_SITES=	http://thekonst.net/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Powerful text mode based programming IDE

LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS NLS

USES=		tar:bzip2 gmake iconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	${ICONV_CONFIGURE_ARG}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
CONFIGURE_ARGS+=--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|strndup|my_strndup|' ${WRKSRC}/parser/src/parser.c \
		${WRKSRC}/parser/src/strfn.c ${WRKSRC}/parser/include/strfn.h

.if ${PORT_OPTIONS:MDOCS}
post-install:
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC} ; ${INSTALL_DATA} FAQ README ${DOCSDIR})
.endif

.include <bsd.port.mk>
