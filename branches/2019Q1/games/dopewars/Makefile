# $MidnightBSD$

PORTNAME=	dopewars
PORTVERSION=	1.5.12
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UNIX rewrite of a game originally based on "Drug Wars"
LICENSE=	gpl2

USES=		gettext
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gtk12

CONFIGURE_ARGS=	--enable-networking --disable-plugins --localstatedir=${DATADIR}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PORTDOCS=	ABOUT-NLS AUTHORS COPYING ChangeLog INSTALL LICENCE NEWS README TODO

post-patch:
	@${REINPLACE_CMD} -e 's!/pixmaps!/dopewars/pixmaps!' \
		${WRKSRC}/src/Makefile.in
	@${REINPLACE_CMD} -e 's!^CFLAGS =!CFLAGS = \@GLIB_CFLAGS\@!' \
		${WRKSRC}/src/gui_client/Makefile.in \
		${WRKSRC}/src/curses_client/Makefile.in
	@${REINPLACE_CMD} -e 's!install-recursive!!g' ${WRKSRC}/doc/Makefile.in

post-install:
.ifndef NOPORTDOCS
	@${INSTALL} -d ${DOCSDIR}/help
	@${INSTALL_DATA} ${WRKSRC}/doc/*html ${WRKSRC}/doc/example* ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/doc/help/*html ${DOCSDIR}/help/
	@${INSTALL_DATA} ${PORTDOCS:S.^.${WRKSRC}/.} ${DOCSDIR}/
	@${INSTALL_MAN} ${WRKSRC}/doc/dopewars.6 ${MAN6PREFIX}/man/man6
.endif

.include <bsd.port.mk>
