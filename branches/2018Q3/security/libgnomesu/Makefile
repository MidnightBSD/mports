# $MidnightBSD$

PORTNAME=	libgnomesu
PORTVERSION=	1.0.0
PORTREVISION=	2
CATEGORIES=	security gnome
MASTER_SITES=	http://members.chello.nl/~h.lai/libgnomesu/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and frontend for running commands as root

LICENSE=	lgpl

USES=		gmake gettext-tools libtool pathfix pkgconfig
USE_GNOME=	gnomeprefix libgnomeui
GNU_CONFIGURE=	yes
USE_GNOME=	gnomeprefix libgnomeui
CONFIGURE_ARGS+=--disable-install-pam \
		--disable-setuid-error
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS EXAMPLES

SUB_FILES=	pkg-message

post-patch:
	@${REINPLACE_CMD} -e 's|-DGTK_DISABLE_DEPRECATED||g' \
		${WRKSRC}/src/Makefile.in

post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${FILESDIR}/gnomesu-pam.sample ${EXAMPLESDIR}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/api.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/libgnomesu.css ${DOCSDIR}
	@${SED} -e "s|%%EXAMPLESDIR%%|${EXAMPLESDIR}|g" ${PKGMESSAGE}

.include <bsd.port.mk>
