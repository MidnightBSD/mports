# $MidnightBSD$

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
USES=		pathfix pkgconfig gmake

.include <bsd.port.mk>
