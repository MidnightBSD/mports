# $MidnightBSD$

PORTNAME=	yasr
PORTVERSION=	0.6.9
CATEGORIES=	accessibility
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-purpose console screen reader

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake
GNU_CONFIGURE=	yes
PORTDOCS=	AUTHORS BUGS CREDITS ChangeLog NEWS README TODO \
		README-br README-de README-es README-fr README-ru
SUB_FILES=	pkg-message

NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls
OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

PLIST_FILES=	bin/yasr \
		man/man1/yasr.1.gz \
		%%DATADIR%%/yasr.conf \
		%%NLS%%share/locale/es/LC_MESSAGES/yasr.mo \
		%%NLS%%share/locale/fr/LC_MESSAGES/yasr.mo

post-patch:
	@${REINPLACE_CMD} -e 's|/bin/bash|/bin/csh|' ${WRKSRC}/yasr.conf

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
