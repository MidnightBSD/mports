# $MidnightBSD: mports/graphics/dia/Makefile,v 1.2 2008/03/21 22:46:40 laffer1 Exp $

PORTNAME=	dia
DISTVERSION=	0.96.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Diagram creation program, similar to Visio
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:${PORTSDIR}/textproc/docbook-xsl
RUN_DEPENDS=	${BUILD_DEPENDS}
LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_BZIP2=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gtk20 gnomehack gnomeprefix libxslt libartlgpl2 intlhack \
		desktopfileutils
WANT_GNOME=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lintl" \
		LOCALBASE="${LOCALBASE}"

MAN1=		dia.1

.if !defined(WITHOUT_PYTHON)
USE_PYTHON=	yes
USE_GNOME+=	pygtk2
CONFIGURE_ARGS=	--with-python
PLIST_SUB=	PYTHON:=""
.else
PLIST_SUB=	PYTHON:="@comment "
.endif

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mlibgnomeui}!=""
USE_GNOME+=		libgnomeui
CONFIGURE_ARGS+=	--enable-gnome --enable-bonobo
GNOME_ENABLED=		yes
PKGNAMESUFFIX=		-gnome
.else
CONFIGURE_ARGS+=      --disable-gnome --disable-bonobo
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/lib/intl.c
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]pkgdatadir[)]/help|(datadir)/gnome/help/dia|g ; \
		s|[(]datadir[)]/help|(datadir)/gnome/help|g'
.ifndef (GNOME_ENABLED)
	@${FIND} ${WRKSRC} -name Makefile.in | \
		${XARGS} ${REINPLACE_CMD} -e \
		's,\(^GTK_LIBS.*\),\1 ${PTHREAD_LIBS}, ; \
		 s,\(^GTK_CFLAGS = \),\1 ${PTHREAD_CFLAGS} ,'
.endif

pre-configure:
	@${REINPLACE_CMD} -e 's|http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl|${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl| ; \
	    	s|echo aout|echo elf|g' \
		${WRKSRC}/configure

post-install:
	@${INSTALL_DATA} ${WRKSRC}/dia.xpm ${PREFIX}/share/dia/
	@-update-desktop-database

.include <bsd.port.post.mk>
