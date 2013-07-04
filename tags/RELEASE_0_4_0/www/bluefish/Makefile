# $MidnightBSD: mports/www/bluefish/Makefile,v 1.4 2011/08/31 03:28:21 laffer1 Exp $

PORTNAME=	bluefish
PORTVERSION=	2.0.2
PORTREVISION=	2
CATEGORIES=	www editors
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTML editor designed for the experienced web designer
LICENSE=	gpl2

LIB_DEPENDS=	pcre.1:${PORTSDIR}/devel/pcre \
		aspell.16:${PORTSDIR}/textproc/aspell \
		enchant.1:${PORTSDIR}/textproc/enchant

INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gtk20 gnomevfs2 gnomemimedata desktopfileutils
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-freedesktop_org-menu=${PREFIX}/share/applications \
		--with-freedesktop_org-mime=${PREFIX}/share/mime \
		--without-gnome2_4-mime \
		--without-gnome2_4-appreg \
		--with-icon-path=${PREFIX}/share/pixmaps

MAN1=		bluefish.1

OPTIONS=	DEBUG "Enable debugging output" Off \
		SPLASH "Show splash screen at startup" On \
		TIDY "Include Tidy HTML cleanup program" Off \
		WEBLINT "Include Weblint syntax and style checker" On

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mlibgnomeui}!=""
USE_GNOME+=	libgnomeui
.endif

# Turns debugging output on
.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--with-debugging-output
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.else
USE_GETTEXT=		yes
PLIST_SUB+=		NLS=""
.endif

.if defined(WITHOUT_SPLASH)
CONFIGURE_ARGS+=	--disable-splash-screen
.endif

.if defined(WITH_TIDY)
RUN_DEPENDS+=	tidy:${PORTSDIR}/www/tidy
.endif
.if !defined(WITHOUT_WEBLINT)
RUN_DEPENDS+=	weblint:${PORTSDIR}/www/weblint
.endif

pre-install:
	@${MKDIR} ${PREFIX}/share/mime

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${MKDIR} ${DOCSDIR}/bflang
	${INSTALL_DATA} ${WRKSRC}/data/bflang/sample.bflang2 ${DOCSDIR}/bflang
.endif

.include <bsd.port.post.mk>
