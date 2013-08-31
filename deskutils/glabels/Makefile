# $MidnightBSD: mports/deskutils/glabels/Makefile,v 1.7 2011/02/02 20:12:29 laffer1 Exp $

PORTNAME=	glabels
PORTVERSION=	2.2.8
CATEGORIES=	deskutils
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program to create labels and business cards

USE_GMAKE=	yes
USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix libgnomeui \
		desktopfileutils intlhack ltverhack
WANT_GNOME=	yes
USES=		gettext
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CPPFLAGS+=	-I${LOCALBASE}/include -DGLIB_COMPILATION
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		glabels.1

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

.include <bsd.port.post.mk>
