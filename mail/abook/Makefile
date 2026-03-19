PORTNAME=	abook
PORTVERSION=	0.6.2
PORTREVISION=	0
CATEGORIES=	mail
MASTER_SITES=	https://abook.sourceforge.io/devel/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Addressbook program with mutt mail client support
WWW=		https://abook.sourceforge.io/

LICENSE=	gpl3

USES=		autoreconf gettext-tools localbase ncurses readline
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share

WRKSRC=		${WRKDIR}

PORTDOCS=	ANNOUNCE AUTHORS BUGS ChangeLog FAQ INSTALL NEWS README THANKS \
		TODO

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
