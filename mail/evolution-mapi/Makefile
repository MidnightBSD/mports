# $MidnightBSD$

PORTNAME=	evolution-mapi
PORTVERSION=	0.30.3
CATEGORIES=	mail gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Evolution plugin to connect to Microsoft Exchange servers
LICENSE=	gpl3

BUILD_DEPENDS=	${PKGFILES}:${PORTSDIR}/mail/evolution
LIB_DEPENDS=	mapi.0:${PORTSDIR}/mail/libmapi
RUN_DEPENDS=	${PKGFILES}:${PORTSDIR}/mail/evolution

PKGFILES=	${LOCALBASE}/libdata/pkgconfig/evolution-plugin.pc

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	evolutiondataserver
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

EVO_VERSION=	2.30
EDS_VERSION=	1.2
PLIST_SUB=	EVO_VERSION=${EVO_VERSION} EDS_VERSION=${EDS_VERSION}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/src/libexchangemapi/Makefile.in
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
	    	${WRKSRC}/configure

.include <bsd.port.post.mk>
