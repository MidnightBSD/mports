# $MidnightBSD: mports/misc/mc-light/Makefile,v 1.4 2011/12/15 00:57:50 laffer1 Exp $

PORTNAME=	mc-light
PORTVERSION=	4.1.40.p9
PORTREVISION=	2
CATEGORIES=	misc shells
MASTER_SITES=	http://mc.linuxinside.com/Releases/
DISTNAME=	mc-${PORTVERSION:S/.p9/-pre9/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Midnight Commander clone

LICENSE=	gpl2

RUN_DEPENDS=	gawk:${PORTSDIR}/lang/gawk

CONFLICTS=	mc-4.7*

OPTIONS_DEFINE=	NLS SUBSHELL MC_IN_MC
SUBSHELL_DESC=	Build with subshell support (only for bash!)
MC_IN_MC_DESC=	Allow run mc inside mc (useful for mcedit)

USES=		pkgconfig iconv
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-included-slang \
		--with-gettext \
		--with-vfs \
		--with-netrc \
		--without-gpm-mouse \
		--with-edit

MAN1=		mc.1 mcedit.1
MAN8=		mcserv.8

.include <bsd.mport.options.mk>

.if ! ${PORT_OPTIONS:MSUBSHELL}
CONFIGURE_ARGS+=--without-subshell
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if ${PORT_OPTIONS:MMC_IN_MC}
CPPFLAGS+=	-DMC_IN_MC_ALLOWED
.endif

post-install:
.for i in a arfs audio cpio deb esp ftplist hp48 iso lha lslR mailfs patchfs rar rpm trpm uarj uha zip zoo
	${CHMOD} 755 ${PREFIX}/share/mc/extfs/${i}
.endfor

.include <bsd.port.mk>
