# $MidnightBSD: mports/misc/iso-codes/Makefile,v 1.15 2011/05/14 22:02:00 laffer1 Exp $

PORTNAME=	iso-codes
PORTVERSION=	3.25
CATEGORIES=	misc
MASTER_SITES=	ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists of the country, language and currency iso names
LICENSE=	lgpl

BUILD_DEPENDS=	xmlproc_parse:${PORTSDIR}/textproc/py-xml

USE_BZIP2=	yes
USE_GNOME=	gnomehack 
USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^pkgconfigdir =/s|=.*|=${PREFIX}/libdata/pkgconfig|'\
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
