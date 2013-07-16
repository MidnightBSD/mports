# $MidnightBSD: mports/x11-themes/icon-naming-utils/Makefile,v 1.6 2012/03/03 23:35:16 laffer1 Exp $

PORTNAME=	icon-naming-utils
PORTVERSION=	0.8.90
PORTREVISION=	1
CATEGORIES=	x11-themes
MASTER_SITES=	GENTOO
MASTER_SITE_SUBDIR=	distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities of the Tango project
LICENSE=	gpl2

BUILD_DEPENDS=	p5-XML-Simple>=0:${PORTSDIR}/textproc/p5-XML-Simple
RUN_DEPENDS=	p5-XML-Simple>=0:${PORTSDIR}/textproc/p5-XML-Simple

USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USES=		pathfix pkgconfig

.include <bsd.port.mk>
