# New ports collection makefile for:   iso-codes
# Date created:			02 April 2005
# Whom:				Koop Mast <kwm@FreeBSD.org>
#
# $MidnightBSD: mports/misc/iso-codes/Makefile,v 1.7 2008/09/21 20:20:28 laffer1 Exp $
# $FreeBSD: ports/misc/iso-codes/Makefile,v 1.21 2007/07/30 03:59:42 beech Exp $
#

PORTNAME=	iso-codes
DISTVERSION=	3.2
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
