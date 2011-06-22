# $MidnightBSD: mports/devel/orc/Makefile,v 1.2 2011/02/02 20:17:33 laffer1 Exp $
# $FreeBSD: ports/devel/orc/Makefile,v 1.6 2010/09/05 08:02:21 mm Exp $

PORTNAME=	orc
PORTVERSION=	0.4.11
CATEGORIES=	devel
MASTER_SITES=	http://code.entropywave.com/download/orc/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and toolset to operate arrays of data
LICENSE=	bsd3

USE_GNOME=	pkgconfig
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GMAKE=	yes

CONFIGURE_ARGS+=	--disable-gtk-doc

SUBDIRS=	orc orc-test tools

OPTIONS=	DOCS "Include gtk-doc documentation" off \
		EXAMPLES "Install example files" off

.include <bsd.port.pre.mk>

.if defined(WITH_DOCS) && !defined(NOPORTDOCS)
SUBDIRS+=	doc
.else
NOPORTDOCS=	yes
.endif

.if defined(WITH_EXAMPLES) && !defined(NOPORTEXAMPLES)
SUBDIRS+=	examples
.else
NOPORTEXAMPLES=	yes
.endif

MAKE_ARGS+=	SUBDIRS="${SUBDIRS}"

post-patch:
	@${REINPLACE_CMD} \
		-E -e '/LIBS/s/-lrt(\ )*//; /LIBRT/s/-lrt//' \
		-e 's|pkgconfigdir=.*|pkgconfigdir=\"\\$$(prefix)/libdata/pkgconfig\"|g' \
		${WRKSRC}/configure 

.include <bsd.port.post.mk>
