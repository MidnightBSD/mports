# $MidnightBSD: mports/audio/lash/Makefile,v 1.1 2010/02/27 19:44:46 laffer1 Exp $

PORTNAME=	lash
PORTVERSION=	0.5.4
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	SAVANNAH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session management system for JACK audio applications
LICENSE=	gpl3

LIB_DEPENDS=	jack:${PORTSDIR}/audio/jack \
		dssialsacompat:${PORTSDIR}/audio/libdssialsacompat \
		uuid:${PORTSDIR}/misc/e2fsprogs-libuuid

OPTIONS_DEFINE=	READLINE DOCS
OPTIONS_DEFAULT=READLINE

USES=		pathfix
USE_GNOME=	gtk20 libxml2
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-alsa-midi
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include/dssi -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MREADLINE}
USES+=		readline
PLIST_SUB+=	READLINE=""
.else
CONFIGURE_ENV+=	vl_cv_lib_readline=no
PLIST_SUB+=	READLINE="@comment "
.endif

.if ${PORT_OPTIONS:MDOCS}
BUILD_DEPENDS+=	texi2html:${PORTSDIR}/textproc/texi2html
.else
CONFIGURE_ENV+=	ac_cv_prog_lash_texi2html=no
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		'/if test/s|==|=|' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		'/texi2html/s|--number||' ${WRKSRC}/docs/Makefile.in

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/docs/lash-manual-html-one-page \
		&& ${INSTALL_DATA} lash-manual.html ${DOCSDIR}
.endif

.include <bsd.port.mk>
