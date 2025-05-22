PORTNAME=	motor
PORTVERSION=	3.4.0
PORTREVISION=	5
CATEGORIES=	devel
MASTER_SITES=	http://thekonst.net/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Powerful text mode based programming IDE

LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

USES=		tar:bzip2 gmake iconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	${ICONV_CONFIGURE_ARG}

PORTDOCS=	FAQ README

NLS_USES=		gettext
NLS_CONFIGURE_ARGS=--with-libintl-prefix=${LOCALBASE}

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|strndup|my_strndup|' ${WRKSRC}/parser/src/parser.c \
		${WRKSRC}/parser/src/strfn.c ${WRKSRC}/parser/include/strfn.h

.include <bsd.port.mk>
