# New ports collection makefile for:	raptor
# Date created:			Nov 22, 2001
# Whom:				ijliao
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/raptor/Makefile,v 1.44 2008/03/20 10:03:49 pav Exp $
#

PORTNAME=	raptor
PORTVERSION=	1.4.16
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://download.librdf.org/source/
MASTER_SITE_SUBDIR=	librdf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDF Parser Toolkit for Redland
LICENSE=	gpl2

LIB_DEPENDS=	curl.4:${PORTSDIR}/ftp/curl

USE_GNOME=	gnomehack gnometarget libxml2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-xml2-config=${LOCALBASE}/bin/xml2-config \
		--with-curl-config=${LOCALBASE}/bin/curl-config \
		--with-pkg-config=${LOCALBASE}/bin/pkg-config \
		--with-xml-parser=libxml --with-www=curl

USE_LDCONFIG=	yes

MAN1=		rapper.1 raptor-config.1
MAN3=		libraptor.3

.include <bsd.port.mk>
