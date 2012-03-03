# $MidnightBSD: mports/x11-themes/icon-naming-utils/Makefile,v 1.5 2011/05/28 06:17:48 laffer1 Exp $

PORTNAME=	icon-naming-utils
PORTVERSION=	0.8.90
CATEGORIES=	x11-themes
MASTER_SITES=	GENTOO
MASTER_SITE_SUBDIR=	distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities of the Tango project
LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple
RUN_DEPENDS=	${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple

USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack pkgconfig

pre-configure:
	@ ${REINPLACE_CMD} -e "s|[(]datadir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g" ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
