# $MidnightBSD: mports/devel/libglade2/Makefile,v 1.9 2013/03/24 19:25:37 laffer1 Exp $

PORTNAME=	libglade2
PORTVERSION=	2.6.4
PORTREVISION=	3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/${PORTNAME:S/2$//}/${PORTVERSION:C/..$//}
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME glade library
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

RUN_DEPENDS=	xmlcatmgr:${PORTSDIR}/textproc/xmlcatmgr

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_PATHFIX=	yes
USE_GNOME=	libxml2 gtk20 referencehack
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc \
		--with-xml-catalog=${LOCALBASE}/share/xml/catalog.ports
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	XMLCATALOG="${LOCALBASE}/bin/xmlcatalog" \
		CATALOG_PORTS_XML="${LOCALBASE}/share/xml/catalog.ports"

OPTIONS_DEFINE=	PYTHON
OPTIONS_DEFAULT=PYTHON

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPYTHON}
BUILD_DEPENDS+=	${PYEXPAT}
RUN_DEPENDS+=	${PYEXPAT}

USE_PYTHON=	yes
PLIST_SUB+=	PYTHON=""
.else
PLIST_SUB+=	PYTHON="@comment "

post-patch:
	@${REINPLACE_CMD} -E 's/in (python.*)+ none/in none/' \
		${WRKSRC}/configure
.endif

post-install:
	${MKDIR} ${PREFIX}/lib/libglade/2.0

.include <bsd.port.mk>

.endif
