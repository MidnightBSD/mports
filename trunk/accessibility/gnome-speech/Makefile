# $MidnightBSD: mports/accessibility/gnome-speech/Makefile,v 1.7 2009/12/25 16:41:37 laffer1 Exp $

PORTNAME=	gnome-speech
PORTVERSION=	0.4.25
CATEGORIES=	accessibility audio gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME text-to-speech API
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix libbonobo
USES=		pathfix
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/lib/libespeak.so)
WITH_ESPEAK=	yes
.endif

#.if exists(${LOCALBASE}/bin/festival)
#WITH_FESTIVAL=	yes
#.endif

.if defined(WITH_ESPEAK)
LIB_DEPENDS+=	espeak.1:${PORTSDIR}/audio/espeak
CONFIGURE_ARGS+=--with-espeak-dir=${LOCALBASE}
PLIST_SUB+=	ESPEAK:=""
.else
PLIST_SUB+=	ESPEAK:="@comment "
.endif

#.if defined(WITH_FESTIVAL)
#RUN_DEPENDS+=	festival:${PORTSDIR}/audio/festival
#.endif

post-patch:
	@${REINPLACE_CMD} -e 's|== x|= x|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|glib/.*\.h>|glib.h>|g' \
		${WRKSRC}/drivers/swift/*.[ch] \
		${WRKSRC}/drivers/dectalk/*.[ch] \
		${WRKSRC}/drivers/theta/*.[ch] \
		${WRKSRC}/drivers/eloquence/*.[ch] \
		${WRKSRC}/drivers/viavoice/*.[ch] \
		${WRKSRC}/drivers/loquendo/*.[ch] \
		${WRKSRC}/drivers/espeak/*.[ch]

.include <bsd.port.post.mk>
