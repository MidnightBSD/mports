# New ports collection makefile for:	scrollkeeper
# Date created:				6 April 2001
# Whom:					Rene Hexel <rh@netbsd.org>
#
# $MidnightBSD: mports/textproc/scrollkeeper/Makefile,v 1.7 2011/02/02 21:23:47 laffer1 Exp $
# $FreeBSD: ports/textproc/scrollkeeper/Makefile,v 1.54 2007/03/19 05:13:47 marcus Exp $
#    $MCom: ports/textproc/scrollkeeper/Makefile,v 1.7 2007/02/20 20:26:47 marcus Exp $

PORTNAME=	scrollkeeper
PORTVERSION=	0.3.14
PORTREVISION=	10
PORTEPOCH=	1
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An Open Document Cataloging Project
LICENSE=        lgpl

BUILD_DEPENDS=	intltool-extract:${PORTSDIR}/textproc/intltool \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
		${LOCALBASE}/share/xml/docbook/${DOCBOOK_VERSION}/catalog.xml:${PORTSDIR}/textproc/docbook-xml \
    		${LOCALBASE}/share/xml/docbook/4.1.2/docbookx.dtd:${PORTSDIR}/textproc/docbook-sk
RUN_DEPENDS=	intltool-extract:${PORTSDIR}/textproc/intltool \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
    		${LOCALBASE}/share/xml/docbook/${DOCBOOK_VERSION}/catalog.xml:${PORTSDIR}/textproc/docbook-xml \
    		${LOCALBASE}/share/xml/docbook/4.1.2/docbookx.dtd:${PORTSDIR}/textproc/docbook-sk

CONFLICTS=	rarian-[0-9]*

DOCBOOK_VERSION=4.2

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_BISON=	build
USE_GNOME=	gnomehack gnomehier libxslt intlhack
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--localstatedir=/var --datadir=${PREFIX}/share \
		--with-omfdirs=${PREFIX}/share/omf \
		--with-xml-catalog=${LOCALBASE}/share/xml/catalog.ports
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lintl" \
		LOCALBASE="${LOCALBASE}"
PLIST_SUB=	LOCALBASE=${LOCALBASE}

MAN1=	scrollkeeper-config.1 scrollkeeper-gen-seriesid.1
MAN5=	scrollkeeper.conf.5
MAN7=	scrollkeeper.7
MAN8=	scrollkeeper-preinstall.8 scrollkeeper-rebuilddb.8 \
	scrollkeeper-update.8

.include <bsd.port.pre.mk>

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e   \
		's|[(]LN_S[)] -f -n|(LN_S) -f|g'
	@${REINPLACE_CMD} -e 's|/usr/share/locale|${PREFIX}/share/locale|g' \
		${WRKSRC}/libs/scrollkeeper.h.in
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/extract/dtds/Makefile.in

.include <bsd.port.post.mk>
