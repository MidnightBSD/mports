# $MidnightBSD$

PORTNAME=	glabels
PORTVERSION=	2.2.8
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program to create labels and business cards

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		desktop-file-utils gettext gmake libtool pathfix pkgconfig \
		shared-mime-info tar:bzip2
USE_GNOME=	gnomeprefix libgnomeui gnomedocutils intlhack
WANT_GNOME=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-update-desktopdb --disable-update-mimedb
CPPFLAGS+=	-I${LOCALBASE}/include -DGLIB_COMPILATION
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mevolutiondataserver}!=""
USE_GNOME+=		evolutiondataserver
CONFIGURE_ARGS+=	--with-libebook
.else
CONFIGURE_ARGS+=	--without-libebook
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|malloc\.h|stdlib\.h|g' \
		${WRKSRC}/iec16022-0.2.1/*.c
	@${REINPLACE_CMD} 's/_LDADD =/& -lm/' ${WRKSRC}/src/Makefile.in

.include <bsd.port.post.mk>
