# New ports collection makefile for:	libidn
# Date created:        	19.06.2003
# Whom:               	Kirill Ponomarew <ponomarew@oberon.net>
#
# $MidnightBSD: mports/dns/libidn/Makefile,v 1.2 2007/11/11 02:58:06 laffer1 Exp $
# $FreeBSD: ports/dns/libidn/Makefile,v 1.67 2007/10/10 12:18:15 krion Exp $
#

PORTNAME=	libidn
PORTVERSION=	1.8
CATEGORIES=	dns
MASTER_SITES=	${MASTER_SITE_GNU_ALPHA} \
		http://josefsson.org/libidn/releases/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalized Domain Names command line tool
LICENSE=	gpl3

USE_GNOME=	gnomehack gnometarget pkgconfig
USE_ICONV=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_PERL5_BUILD=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"

INFO=	libidn

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|@image{components}||g' \
		${WRKSRC}/doc/libidn.texi
	@${REINPLACE_CMD} -e 's|$$(AUTOMAKE)|${TRUE}|' \
			-e 's|imagesdir = $$(infodir)|imagesdir = $$(docdir)|' \
		${WRKSRC}/doc/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in FAQ NEWS README
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include "Makefile.man"
.include <bsd.port.mk>
