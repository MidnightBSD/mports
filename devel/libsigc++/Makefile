# $MidnightBSD: mports/devel/libsigc++/Makefile,v 1.4 2009/06/29 04:02:08 laffer1 Exp $

PORTNAME=	libsigc++
PORTVERSION=	1.0.4
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME:S/$/:gnome/} \
		${MASTER_SITE_SOURCEFORGE:S/$/:sf/}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/1.0/:gnome \
		libsigc/:sf
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:sf,gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Callback Framework for C++
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack

pre-configure:
	@${REINPLACE_CMD} -e 's#^sh libtool#${LIBTOOL}#' ${WRKSRC}/configure

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/FEATURES ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/API ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/FAQ ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/UML ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/conventions ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/diagrams ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/marshal ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/powerusers ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/requirements ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/riscos ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/signals ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/win32 ${DOCSDIR}
.endif

.include <bsd.port.mk>
