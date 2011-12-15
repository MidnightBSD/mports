# New ports collection makefile for:	mc-light
# Date created:				31.08.2004
# Whom:					Roman Y. Bogdanov <sam@brj.pp.ru>
#
# $MidnightBSD: mports/misc/mc-light/Makefile,v 1.3 2011/05/14 22:25:54 laffer1 Exp $
# $FreeBSD: ports/misc/mc-light/Makefile,v 1.14 2008/06/06 13:45:34 edwin Exp $

PORTNAME=	mc-light
PORTVERSION=	4.1.40.p9
PORTREVISION=	1
CATEGORIES=	misc shells
MASTER_SITES=	http://mc.linuxinside.com/Releases/
DISTNAME=	mc-${PORTVERSION:S/.p9/-pre9/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A lightweight Midnight Commander clone
LICENSE=	gpl2

RUN_DEPENDS+=	gawk:${PORTSDIR}/lang/gawk

CONFLICTS=	mc-4.7*

OPTIONS=	\
		SUBSHELL "Build with subshell support (only for bash!)" off \
		MC_IN_MC "Allow run mc inside mc (useful for mcedit)" off

USE_GMAKE=	yes
USE_ICONV=	yes
USE_GNOME=	pkgconfig 
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-included-slang \
		--with-gettext \
		--with-vfs \
		--with-netrc \
		--without-gpm-mouse \
		--with-edit

MAN1=		mc.1 mcedit.1
MAN8=		mcserv.8

.include <bsd.port.pre.mk>

.if !defined(WITH_SUBSHELL)
CONFIGURE_ARGS+=--without-subshell
.endif

# Add an NLS option later
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "

.if defined(WITH_MC_IN_MC)
CONFIGURE_ENV+=	CPPFLAGS=-DMC_IN_MC_ALLOWED
.endif

post-install:
.for i in a arfs audio cpio deb esp ftplist hp48 iso lha lslR mailfs patchfs rar rpm trpm uarj uha zip zoo
	${CHMOD} 755 ${PREFIX}/share/mc/extfs/${i}
.endfor

.include <bsd.port.post.mk>
