# New ports collection makefile for:	gdome2
# Date created:		7 July 2001
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $MidnightBSD: mports/textproc/gdome2/Makefile,v 1.3 2009/09/20 02:11:33 laffer1 Exp $
# $FreeBSD: ports/textproc/gdome2/Makefile,v 1.28 2007/01/28 09:07:44 kris Exp $
#

PORTNAME=	gdome2
PORTVERSION=	0.8.1
PORTREVISION=	4
CATEGORIES=	textproc
MASTER_SITES=	http://gdome2.cs.unibo.it/tarball/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome DOM Engine
LICENSE=	gpl2

LIB_DEPENDS=	xml2.5:${PORTSDIR}/textproc/libxml2

USE_AUTOTOOLS=	libtool:22
USE_GNOME=	glib20 gnomehack
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	GLIB_CONFIG="${LOCALBASE}/bin/pkg-config glib-2.0" \
		CPPFLAGS="-I${LOCALBASE}/include"
PLIST_SUB=	DOCSDIR="share/doc/${DISTNAME}"
USE_LDCONFIG=	yes

MAN1=	gdome-config.1

post-patch:
	@${FIND} ${WRKSRC} -type f -and \
		'(' -name '*.[ch]' -or -name '*.xml' ')' | \
		${XARGS} ${REINPLACE_CMD} -e ' \
		 s,<parser\.h>,<libxml/parser.h>,; \
		 s,<hash\.h>,<libxml/hash.h>,; \
		 s,<xmlmemory\.h>,<libxml/xmlmemory.h>,; \
		 s,<tree\.h>,<libxml/tree.h>,; \
		 s,<xmlerror\.h>,<libxml/xmlerror.h>,; \
		 s,<xmlIO\.h>,<libxml/xmlIO.h>,; \
		 s,<parserInternals\.h>,<libxml/parserInternals.h>,; \
		 s,<entities\.h>,<libxml/entities.h>,'

.include <bsd.port.mk>
