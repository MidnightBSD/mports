# Ports collection makefile for:	gtkperf
# Date created:				2006-04-22
# Whom:					Andreas Kohn <andreas@syndrom23.de>
#
# $MidnightBSD: mports/benchmarks/gtkperf/Makefile,v 1.1 2007/05/20 02:16:05 laffer1 Exp $
# $FreeBSD: ports/benchmarks/gtkperf/Makefile,v 1.5 2007/03/12 10:01:38 miwi Exp $
#

PORTNAME=		gtkperf
PORTVERSION=		0.40
PORTREVISION=		1
CATEGORIES=		benchmarks
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=		${PORTNAME}_${PORTVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Measure your system's GTK+ performance
LICENSE=		gpl2

WRKSRC=			${WRKDIR}/${PORTNAME}
USE_GMAKE=		yes
GNU_CONFIGURE=		yes
USE_GNOME=		gtk20 gnomeprefix
USE_X_PREFIX=		yes
USE_GETOPT_LONG=	yes

.if !defined(WITHOUT_NLS)
USE_GETTEXT=		yes
USE_ICONV=		yes
CONFIGURE_ENV+=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS+=	--enable-nls
PLIST_SUB=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB=		NLS="@comment "
.endif

.include <bsd.port.mk>
