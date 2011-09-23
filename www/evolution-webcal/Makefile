# $MidnightBSD: mports/www/evolution-webcal/Makefile,v 1.1 2010/08/14 04:15:00 laffer1 Exp $

PORTNAME=	evolution-webcal
PORTVERSION=	2.32.0
CATEGORIES=	www gnome
MASTER_SITES=	GNOME
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Webcal(endar) handler for gnome
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_PERL5=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack evolutiondataserver libgnomeui
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	evolution-webcal.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|@mkdir_p@|mkdir -p|g' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.mk>
