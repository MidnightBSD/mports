# $MidnightBSD$

PORTNAME=	libgnomesu
PORTVERSION=	1.0.0
PORTREVISION=	1
CATEGORIES=	security gnome
MASTER_SITES=	http://members.chello.nl/~h.lai/libgnomesu/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and frontend for running commands as root
LICENSE=	gpl2
# while the library is lgpl, it uses GPL components directly.

USES=		gmake libtool
USE_GNOME=	gnomeprefix libgnomeui
CONFIGURE_ARGS+=--disable-install-pam
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"

post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${FILESDIR}/gnomesu-pam.5.x.sample ${EXAMPLESDIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/api.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/libgnomesu.css ${DOCSDIR}
.endif
	@${SED} -e "s|%%EXAMPLESDIR%%|${EXAMPLESDIR}|g" ${PKGMESSAGE}

.include <bsd.port.mk>
