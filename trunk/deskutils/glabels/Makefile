# New ports collection makefile for:	glabels
# Date created:		29 September 2002
# Whom:			Martin Klaffenboeck <martin.klaffenboeck@gmx.at>
#
# $MidnightBSD: mports/deskutils/glabels/Makefile,v 1.2 2008/03/30 22:21:30 laffer1 Exp $
# $FreeBSD: ports/deskutils/glabels/Makefile,v 1.41 2007/05/19 20:01:34 flz Exp $
#

PORTNAME=	glabels
PORTVERSION=	2.2.2
PORTREVISION=	3
CATEGORIES=	deskutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program to create labels and business cards
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack gnomeprefix gnometarget libgnomeui libgnomeprintui \
		desktopfileutils intlhack 
USE_GMAKE=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
                PKG_CONFIG="${LOCALBASE}/bin/pkg-config"

MAN1=		glabels.1

post-patch:
	@${REINPLACE_CMD} -e 's|malloc\.h|stdlib\.h|g' \
		${WRKSRC}/iec16022-0.2.1/*.c



.include <bsd.port.mk>
