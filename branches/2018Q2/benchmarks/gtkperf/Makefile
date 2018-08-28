# $MidnightBSD$

PORTNAME=	gtkperf
PORTVERSION=	0.40
PORTREVISION=	5
CATEGORIES=	benchmarks
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Measure your system's GTK+ performance

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}
USES=		gmake pkgconfig
GNU_CONFIGURE=	yes
USE_GNOME=	gtk20 gnomeprefix

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext iconv
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS+=	--enable-nls
PLIST_SUB=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB=		NLS="@comment "
.endif

.include <bsd.port.mk>
