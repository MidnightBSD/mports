# $MidnightBSD: mports/sysutils/nvclock/Makefile,v 1.3 2012/09/08 16:42:43 laffer1 Exp $

PORTNAME=	nvclock
DISTVERSION=	0.8b4
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/0.8%20%28beta4%29
DISTNAME=	nvclock${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	nVidia graphic card status and overclocking tool

LICENSE=	gpl2

USE_GMAKE=	yes
GNU_CONFIGURE=	yes

MAN1=		nvclock.1
PORTDOCS=	ABOUT AUTHORS ChangeLog FAQ README

OPTIONS_DEFINE=	NVCONTROL X11 DOCS
OPTIONS_DEFAULT=	NVCONTROL X11

NVCONTROL_DESC=	NV-CONTROL support (for OpenGL settings)
X11_DESC=	Build GUI program (requires GTK+ 2.x)

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNVCONTROL}
USE_XORG=	xext
USE_GNOME=	pkgconfig
.else
CONFIGURE_ARGS+=	--disable-nvcontrol
.endif

.if ${PORT_OPTIONS:MX11}
USE_GNOME=	gtk20
PLIST_FILES+=	bin/nvclock_gtk
.else
CONFIGURE_ARGS+=	--disable-gtk
.endif

post-patch:
# Uphold our C[XX]FLAGS except for backend part, it must be compiled with -O0
	@${REINPLACE_CMD} -E 's|^(C(XX)?FLAGS)=|\1+=|' \
		${WRKSRC}/src/gtk/Makefile.in \
		${WRKSRC}/src/qt/Makefile.in \
		${WRKSRC}/src/nvcontrol/Makefile.in

do-install:
	${GMAKE} -C ${WRKSRC}/src install
	${GMAKE} -C ${WRKSRC} install-man
.if ${PORT_OPTIONS:MDOCS}
	${GMAKE} -C ${WRKSRC} install-docs
.endif

.include <bsd.port.mk>
