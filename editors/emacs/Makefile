# New ports collection makefile for:	GNU emacs
# Date created:		11 October 2001
# Whom:			MANTANI Nobutaka <nobutaka@nobutaka.com>
#
# $MidnightBSD: mports/editors/emacs/Makefile,v 1.10 2010/05/08 02:18:02 laffer1 Exp $
# $FreeBSD: ports/editors/emacs/Makefile,v 1.71 2007/07/24 15:10:13 rafan Exp $
#

PORTNAME=	emacs
PORTVERSION=	${EMACS_VER}
PORTREVISION=	2
CATEGORIES=	editors ipv6
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU editing macros
LICENSE=	gpl2

CONFLICTS=	emacs-19.* emacs-21.* \
		xemacs-[0-9]* xemacs-devel-[0-9]* \
		xemacs-mule-[0-9]* xemacs-devel-mule-[0-9]*

EMACS_VER=	22.3
GNU_CONFIGURE=	yes
USE_GMAKE=	yes

OPTIONS=	X11 "Enable X11 support."  On \
		GTP "Enable GTK+ support." On \
		XIM "Enable X11 Input Method supper." On 

MAN1=		ctags.1 emacs.1 emacsclient.1 etags.1
PLIST_SUB=	EMACS_VER=${EMACS_VER} EMACS_ARCH=${CONFIGURE_TARGET}

MAKE_ENV=	LC_ALL=C

INFO=		ada-mode autotype calc ccmode cl dired-x ebrowse ediff \
		efaq eintr elisp emacs-mime emacs erc eshell eudc \
		flymake forms gnus idlwave info message mh-e newsticker \
		org pcl-cvs pgg rcirc reftex sc ses sieve smtpmail speedbar \
		tramp url vip viper widget woman

LATEST_LINK=	emacs
WANT_GNOME=	yes

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_X11)
.if defined(WITHOUT_GTK)
LIB_DEPENDS=	Xaw3d.${XAWVER}:${PORTSDIR}/x11-toolkits/Xaw3d
.endif
LIB_DEPENDS+=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		tiff.4:${PORTSDIR}/graphics/tiff \
		ungif.5:${PORTSDIR}/graphics/libungif \
		png.6:${PORTSDIR}/graphics/png
.endif

.if !defined(WITHOUT_X11)
.if !defined(WITHOUT_GTK)
USE_GNOME=	gtk20
.else
USE_XLIB=	yes
.endif
USE_XORG+=	xpm
.endif

CONFIGURE_TARGET=	${MACHINE_ARCH}-freebsd
.if defined(WITHOUT_X11)
CONFIGURE_ARGS=		--with-x=no
.else
.if !defined(WITHOUT_GTK)
CONFIGURE_ARGS=		--with-gtk
.endif
.endif

.if defined(WITHOUT_XIM)
CONFIGURE_ARGS+=	--without-xim
.endif

.include <bsd.port.post.mk>
