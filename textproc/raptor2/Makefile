# $MidnightBSD: mports/textproc/raptor2/Makefile,v 1.1 2012/03/01 13:19:05 laffer1 Exp $

PORTNAME=	raptor2
PORTVERSION=	2.0.7
CATEGORIES=	textproc
MASTER_SITES=	http://download.librdf.org/source/ \
		SF/librdf/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDF Parser Toolkit for Redland
LICENSE=	gpl2

LIB_DEPENDS=	curl.6:${PORTSDIR}/ftp/curl \
		yajl.2:${PORTSDIR}/devel/yajl

CONFLICTS=	raptor-1.4.1[0-9]* raptor-1.4.21

USE_GNOME=	gnomehack libxml2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-xml2-config=${LOCALBASE}/bin/xml2-config \
		--with-curl-config=${LOCALBASE}/bin/curl-config \
		--with-pkg-config=${LOCALBASE}/bin/pkg-config \
		--with-xml-parser=libxml --with-www=curl

USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

MAN1=		rapper.1
MAN3=		libraptor2.3

.include <bsd.port.mk>
