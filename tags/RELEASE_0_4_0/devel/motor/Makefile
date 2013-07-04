# $MidnightBSD: mports/devel/motor/Makefile,v 1.4 2008/10/13 20:59:02 ctriv Exp $

PORTNAME=	motor
PORTVERSION=	3.4.0
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	http://thekonst.net/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A powerful text mode based programming IDE
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE}
.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB=	NLS="@comment "
.endif

MAN1=		motor.1

post-patch:
	@${REINPLACE_CMD} -e 's|zxvf|&o|' ${WRKSRC}/share/Makefile.in
	@${REINPLACE_CMD} -e 's|strndup|my_strndup|' ${WRKSRC}/parser/src/parser.c \
		${WRKSRC}/parser/src/strfn.c ${WRKSRC}/parser/include/strfn.h

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC} ; ${INSTALL_DATA} FAQ README ${DOCSDIR})
.endif

.include <bsd.port.mk>
