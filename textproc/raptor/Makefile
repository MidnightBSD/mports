# $MidnightBSD: mports/textproc/raptor/Makefile,v 1.5 2010/05/31 20:32:18 laffer1 Exp $

PORTNAME=	raptor
PORTVERSION=	1.4.21
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	SF/librdf/${PORTNAME}/${PORTVERSION} \
		http://download.librdf.org/source/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDF Parser Toolkit for Redland
LICENSE=	gpl2

LIB_DEPENDS=	curl.6:${PORTSDIR}/ftp/curl

USE_GNOME=	gnomehack libxml2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-xml2-config=${LOCALBASE}/bin/xml2-config \
		--with-curl-config=${LOCALBASE}/bin/curl-config \
		--with-pkg-config=${LOCALBASE}/bin/pkg-config \
		--with-xml-parser=libxml --with-www=curl

USE_LDCONFIG=	yes

MAN1=		rapper.1 raptor-config.1
MAN3=		libraptor.3

.include <bsd.port.mk>
