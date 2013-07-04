# New ports collection makefile for:	afterstep
#
# $MidnightBSD: mports/x11-wm/afterstep/Makefile,v 1.9 2011/08/21 20:40:38 laffer1 Exp $
# $FreeBSD: ports/x11-wm/afterstep/Makefile,v 1.55 2007/04/13 12:16:16 dinoex Exp $
#

PORTNAME=	afterstep
PORTVERSION=	2.2.11
PORTREVISION=	1
CATEGORIES=	x11-wm afterstep
MASTER_SITES=	${MASTER_SITE_AFTERSTEP}
MASTER_SITE_SUBDIR=	stable
DISTNAME=	AfterStep-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Window manager originally based on the Bowman NeXTstep clone
LICENSE=	x11

GNU_CONFIGURE=	yes
USE_GMAKE=	yes

LIB_DEPENDS=	cairo.2:${PORTSDIR}/graphics/cairo \
		execinfo.1:${PORTSDIR}/devel/libexecinfo \
		freetype.9:${PORTSDIR}/print/freetype2 \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png \
		rsvg-2.2:${PORTSDIR}/graphics/librsvg2 \
		tiff.4:${PORTSDIR}/graphics/tiff \
		ungif.5:${PORTSDIR}/graphics/libungif
RUN_DEPENDS=	xli:${PORTSDIR}/graphics/xli

USE_GNOME=	glib20 gtk20 pango
USE_ICONV=	yes
USE_XORG+=	ice sm x11 xcursor xext xfixes xi xinerama xrandr xrender

CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS+=--disable-ascp \
		--enable-i18n \
		--disable-send-postcard-to-developer \
		--with-helpcommand="xterm -e man" \
		--with-jpeg-includes="${LOCALBASE}/include" \
		--with-jpeg-libs="${LOCALBASE}/lib" \
		--with-png-includes="${LOCALBASE}/include" \
		--with-png-libs="${LOCALBASE}/lib" \
		--with-ungif

MAN1=		ASDatabase.1x ASDatabaseEntry.1x AfterStep.1x Align.1x \
		Animate.1x AnimateTypes.1x Arrange.1x AutoExec.1x \
		BalloonContents.1x Base.1x Bevel.1x ColorScheme.1x \
		Feel.1x FeelWindowBox.1x Functions.1x Gravity.1x Look.1x \
		MyBackground.1x MyFrame.1x MyStyle.1x Pager.1x \
		PagerDecorations.1x Placement.1x Sound.1x SoundEvents.1x \
		SupportedHints.1x TbarLayout.1x Wharf.1x WharfFolders.1x \
		WharfSounds.1x WinCommand.1x WinList.1x WinTabs.1x \
		afterstep_faq.1x asimagexml.1x

.if defined(WITH_DIFFERENT_LOOKNFEELS)
CONFIGURE_ARGS+=      --enable-different-looknfeels
.endif

.if !defined(WITH_SAVEWINDOWS)
CONFIGURE_ARGS+=      --disable-savewindows
.endif

.include <bsd.port.mk>
