# $FreeBSD: ports/audio/lash/Makefile,v 1.12 2009/07/31 13:49:05 dinoex Exp $
# $MidnightBSD$

PORTNAME=	lash
PORTVERSION=	0.5.4
CATEGORIES=	audio
MASTER_SITES=	http://download.savannah.gnu.org/releases/lash/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session management system for JACK audio applications
LICENSE=	gpl2

LIB_DEPENDS=	jack.0:${PORTSDIR}/audio/jack \
		uuid.1:${PORTSDIR}/misc/e2fsprogs-libuuid \
		dssialsacompat.0:${PORTSDIR}/audio/libdssialsacompat

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-alsa-midi
CFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/dssi -L${LOCALBASE}/lib
USE_GMAKE=	yes
USE_GNOME=	gtk20 libxml2 gnomehack
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/lib/libreadline.so.6)
LIB_DEPENDS+=	readline.6:${PORTSDIR}/devel/readline
.endif

.include <bsd.port.post.mk>
