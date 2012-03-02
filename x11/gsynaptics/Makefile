# $MidnightBSD: mports/x11/gsynaptics/Makefile,v 1.2 2010/05/30 21:27:29 laffer1 Exp $

PORTNAME=	gsynaptics
PORTVERSION=	0.9.9
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_JP}
MASTER_SITE_SUBDIR=	gsynaptics/21527

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Synaptics Touchpad setting tool
LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser

USE_GNOME=	lthack intlhack intltool pkgconfig gtk20 libgnome libglade2 libgnomeui
USE_ICONV=	yes
USE_GMAKE=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		gsynaptics.1 gsynaptics-init.1

.include <bsd.port.pre.mk>

RUN_DEPENDS+=	${LOCALBASE}/lib/xorg/modules/input/synaptics_drv.so:${PORTSDIR}/x11-drivers/xf86-input-synaptics

.include <bsd.port.post.mk>
