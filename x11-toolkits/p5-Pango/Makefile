# Created by: Cheng-Lung Sung <clsung@FreeBSD.org>

PORTNAME=	Pango
PORTVERSION=	1.227
PORTREVISION=	1
CATEGORIES=	x11-toolkits lang perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:XAOC
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for layout and render i18n text

LICENSE=	lgpl2.1

BUILD_DEPENDS=	p5-ExtUtils-Depends>=0.300:devel/p5-ExtUtils-Depends \
		p5-ExtUtils-PkgConfig>=1.03:devel/p5-ExtUtils-PkgConfig \
		p5-Cairo>=1:graphics/p5-Cairo \
		p5-Glib>=1.220:devel/p5-Glib
RUN_DEPENDS=	p5-Glib>=1.220:devel/p5-Glib

USES=		gnome perl5
USE_GNOME=	pango
USE_PERL5=	configure
MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.mk>
