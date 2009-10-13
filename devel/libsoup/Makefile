# New ports collection makefile for:	libsoup
# Date created:				7 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/devel/libsoup/Makefile,v 1.10 2009/09/20 00:43:52 laffer1 Exp $

PORTNAME=	libsoup
PORTVERSION=	2.26.3
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A SOAP (Simple Object Access Protocol) implementation in C
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt \
		proxy.0:${PORTSDIR}/net/libproxy 
		
USE_GNOME=	gnomehack glib20 libxml2 ltverhack referencehack gconf2
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
USE_SQLITE=	yes

CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION="2.4"

OPTIONS=	SSL "Enable GnuTLS SSL support" on

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_SSL)
LIB_DEPENDS+=	gnutls.26:${PORTSDIR}/security/gnutls
.else
CONFIGURE_ARGS+=--disable-ssl
.endif

.include <bsd.port.pre.mk>

pre-everything::
	@${ECHO_MSG} ""
	@${ECHO_MSG} "libsoup has the following configurable option(s):"
	@${ECHO_MSG} "	WITHOUT_SSL	Disable GnuTLS SSL support"
	@${ECHO_MSG} ""

post-patch:
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g ; \
	    	s|" == "|" = "|g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>

.endif
