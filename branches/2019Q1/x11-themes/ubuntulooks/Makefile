# $MidnightBSD$

PORTNAME=	ubuntulooks
PORTVERSION=	0.9.12
PORTREVISION=	2
CATEGORIES=	x11-themes
MASTER_SITES=	http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntulooks/
DISTNAME=	${PORTNAME}_${PORTVERSION}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK+ 2.x engine from Ubuntu Dapper

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gtk-engines-2.pc:${PORTSDIR}/x11-themes/gtk-engines2
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gtk-engines-2.pc:${PORTSDIR}/x11-themes/gtk-engines2

GNU_CONFIGURE=	yes
USES=		pkgconfig libtool gmake
USE_GNOME=	gtk20
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.mk>
