# New ports collection makefile for:	libgnomesu
# Date created:				12 January 2005
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/security/libgnomesu/Makefile,v 1.1 2008/03/05 02:20:27 laffer1 Exp $
# $FreeBSD: ports/security/libgnomesu/Makefile,v 1.19 2007/10/24 23:36:32 marcus Exp $

PORTNAME=	libgnomesu
PORTVERSION=	1.0.0
PORTREVISION=	1
CATEGORIES=	security gnome
MASTER_SITES=	http://members.chello.nl/~h.lai/libgnomesu/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and frontend for running commands as root
LICENSE=	gpl2
# while the library is lgpl, it uses GPL components directly.

USE_XLIB=	yes
USE_GETOPT_LONG=yes
USE_AUTOTOOLS=	libtool:15
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomeprefix libgnomeui
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
