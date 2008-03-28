# New ports collection makefile for:	icon-naming-utils
# Date created:		2005-11-05
# Whom:			Phillip Neumann <pneumann@gmail.com>
#
# $MidnightBSD: mports/x11-themes/icon-naming-utils/Makefile,v 1.1 2007/08/15 05:03:35 laffer1 Exp $
# $FreeBSD: ports/x11-themes/icon-naming-utils/Makefile,v 1.8 2007/03/04 20:26:22 rafan Exp $
#

PORTNAME=	icon-naming-utils
PORTVERSION=	0.8.6
CATEGORIES=	x11-themes
MASTER_SITES=	http://tango.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities of the Tango project
LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple
RUN_DEPENDS=	${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple

USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack pkgconfig gnometarget

pre-configure:
	@ ${REINPLACE_CMD} -e "s|[(]datadir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g" ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
