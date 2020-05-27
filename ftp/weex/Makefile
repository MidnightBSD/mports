# Created by: Emanuel Haupt <ehaupt@critical.ch>

PORTNAME=	weex
PORTVERSION=	2.8.2
CATEGORIES=	ftp
MASTER_SITES=	SF/weex/weex
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-interactive FTP client

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/doc/COPYING

USES=		autoreconf gmake ssl gettext-tools

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-cafile=${LOCALBASE}/share/certs/ca-root-nss.crt
CPPFLAGS+=	-I${OPENSSLINC}
LIBS+=		-L${OPENSSLLIB}
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

OPTIONS_DEFINE=	EXAMPLES NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext-runtime

post-patch:
	@${RM} -r ${WRKSRC}/intl

pre-configure:
	${CP} ${LOCALBASE}/share/gettext/po/Makevars.template \
		${WRKSRC}/po/Makevars

post-install:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/sample.weexrc ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
