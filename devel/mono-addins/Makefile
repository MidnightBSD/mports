PORTNAME=	mono-addins
PORTVERSION=	1.3
DISTVERSIONPREFIX=	${PORTNAME}-
PORTREVISION=	2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mono framework to create extensible applications
WWW=		https://www.mono-project.com/Mono.Addins

LICENSE=	mit

USE_GITHUB=	yes
GH_ACCOUNT=	mono

WRKSRC=		${WRKDIR}/mono-addins-mono-addins-1.3

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_path_MCS=${LOCALBASE}/bin/mcs
USES=		autoreconf gmake gnome mono pkgconfig

OPTIONS_DEFINE=	GTK2 GTK3
OPTIONS_DEFAULT=GTK2

GTK2_USE=	GNOME=gtksharp20
GTK2_CONFIGURE_ENABLE=	gui
OPTIONS_SUB=	yes

#GTK3_USE=	GNOME=gtksharp30
GTK3_CONFIGURE_ENABLE=	gui-gtk3

PLIST_SUB+=	VER=1.0.0

.include <bsd.port.mk>
