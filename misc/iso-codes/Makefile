# $MidnightBSD: mports/misc/iso-codes/Makefile,v 1.11 2009/08/24 20:33:27 laffer1 Exp $

PORTNAME=	iso-codes
DISTVERSION=	3.18
CATEGORIES=	misc
MASTER_SITES=	ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists of the country, language and currency iso names
LICENSE=	lgpl

BUILD_DEPENDS=	xmlproc_parse:${PORTSDIR}/textproc/py-xml

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnometarget
USE_PYTHON_BUILD=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^pkgconfigdir =/s|=.*|=${PREFIX}/libdata/pkgconfig|'\
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
