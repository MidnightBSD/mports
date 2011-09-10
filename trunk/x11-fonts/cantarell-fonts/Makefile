# $MidnightBSD: mports/x11-fonts/cantarell-fonts/Makefile,v 1.1 2011/09/10 21:21:35 laffer1 Exp $
# $FreeBSD: ports/x11-fonts/cantarell-fonts/Makefile,v 1.1 2011/07/29 18:23:07 kwm Exp $

PORTNAME=	cantarell-fonts
PORTVERSION=	0.0.6
CATEGORIES=	x11-fonts gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cantarell, a Humanist sans-serif font family
LICENSE=	other

LIB_DEPENDS=	fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig

USE_GNOME=	pkgconfig
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
FONTSDIR=	share/fonts/cantarell
PLIST_SUB=	FONTSDIR=${FONTSDIR}

post-patch:
	@${REINPLACE_CMD} -e 's|(datadir)/fontconfig/conf.avail/|(prefix)/etc/fonts/conf.avail/|g' \
		${WRKSRC}/fontconfig/Makefile.in

post-install:
	@${LOCALBASE}/bin/fc-cache -f -v ${PREFIX}/${FONTSDIR}

.include <bsd.port.mk>
